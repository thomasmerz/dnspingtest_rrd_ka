#!/bin/bash

PING=/usr/bin/dnsping
COUNT=4
DEADLINE=10

dnsping_host() {
    local output=$($PING -q -c $COUNT -w $DEADLINE -s $1 nextwurz.mooo.com 2>&1)
    # notice $output is quoted to preserve newlines
    local temp=$(echo "$output"| awk '
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
    RETURN_VALUE=$temp
}

# dnsping some hosts for some dns resolvers:
# 192.168.42.241 = merz-nimbus/localhost ("LAN")
# 192.168.0.13 = via tp-ax6000-router ("WLAN")
# dns1.nextdns.io 45.90.28.39
# dns2.nextdns.io 45.90.30.39
for resolvers in 192.168.42.241 192.168.0.13 45.90.28.39 45.90.30.39 1.1.1.1 1.0.0.1; do
  dnsping_host $resolvers
  /usr/bin/rrdtool update \
      /home/thomas/Documents/Administration/dnspingtest_rrd/dnsping_$resolvers.rrd \
      --template \
      pl:rtt \
      N:$RETURN_VALUE
  # https://forum.syncthing.net/t/why-are-rrd-files-transferred-by-time-and-not-immediately/16391
  touch /home/thomas/Documents/Administration/dnspingtest_rrd/dnsping_$resolvers.rrd
done

