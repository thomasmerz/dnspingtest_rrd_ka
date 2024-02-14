#!/bin/bash

# different dirs on different hosts:
case $(hostname) in
  merz-nimbus)
    cd /home/thomas/Documents/Administration/dnspingtest_rrd."$(hostname)"/ || exit 1
    ;;
  ubuntu-cx11-02|ubuntu-cx11-03|ubuntu-fsn1-1)
    cd ~/dev/dnspingtest_rrd."$(hostname)"/ || exit 1
    ;;
  *)
    echo "Please add '$(hostname)' in 'case' block in this script: $0."
    exit 1
    ;;
esac

PING=/usr/bin/dnsping
COUNT=4
DEADLINE=5
tcp=''

dnsping_host() {
    output="$($PING "$tcp" -q -c $COUNT -w $DEADLINE -s "$1" nextwurz.mooo.com 2>&1)"
    # notice $output is quoted to preserve newlines
    temp=$(echo "$output"| awk '
        BEGIN           {pl=100; rtt=0.1}
        /requests transmitted/   {
            match($0, /([0-9]+)% lost/, matchstr)
            pl=matchstr[1]
        }
        /^min/          {
            # looking for something like "min=14.553 ms, avg=16.015 ms, max=17.675 ms, stddev=1.571 ms"
            match($3, /avg=(.*)/, a)
            rtt=a[1]
        }
        /Name or service not known/  {
            # no output at all means network is probably down
            pl=100
            rtt=0.1
        }
        END         {print pl ":" rtt}
        '|cut -d"=" -f2)
    RETURN_VALUE="$temp"
}

# -- MAIN --

if [ ! -f dnsresolvers.list ]; then
  pwd
  echo "dnsresolvers.list: file not found."
  exit 2
fi
resolverlist="$(grep -v ^\# dnsresolvers.list)"
[ -z "$resolverlist" ] && exit 1
for resolver in $resolverlist; do
  if echo "$resolver"|grep -q 'T'; then
    resolver="$(echo "$resolver"|cut -d "-" -f1)"
    tcp="-T"
  fi
  # create rrd-file from scratch if not existing:
  if ! [ -f data/dnsping_"${resolver}".rrd ]; then
    /usr/bin/rrdtool create data/dnsping_"${resolver}".rrd \
      --step 60 \
      DS:pl:GAUGE:600:0:100 \
      DS:rtt:GAUGE:600:0:10000000 \
      RRA:AVERAGE:0.5:1:800 \
      RRA:AVERAGE:0.5:6:800 \
      RRA:AVERAGE:0.5:24:800 \
      RRA:AVERAGE:0.5:288:800 \
      RRA:MAX:0.5:1:800 \
      RRA:MAX:0.5:6:800 \
      RRA:MAX:0.5:24:800 \
      RRA:MAX:0.5:288:800
  fi
  # do the dnsping:
  dnsping_host "$resolver"
  # and update rrd:
  /usr/bin/rrdtool update \
      data/dnsping_"$resolver".rrd \
      --template \
      pl:rtt \
      N:"$RETURN_VALUE"
  # https://forum.syncthing.net/t/why-are-rrd-files-transferred-by-time-and-not-immediately/16391
  touch data/dnsping_"$resolver".rrd
done

