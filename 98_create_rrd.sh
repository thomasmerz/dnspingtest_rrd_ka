#!/bin/bash

# Note: The following RRD files are created with a step size of 60
# seconds, hence they are suitable with Interval value of 5 in rrd.cfg.
# If you plan on running with Interval 1, you should recreate these files
# with a step size of 60 and RRA as follows
#    DS:some_data_source:GAUGE:120:0:200
#    RRA:AVERAGE:0.5:1:600
#    RRA:AVERAGE:0.5:5:600
#    RRA:AVERAGE:0.5:30:700
#    RRA:AVERAGE:0.5:120:775
#    RRA:AVERAGE:0.5:1440:797
#    RRA:MAX:0.5:1:600
#    RRA:MAX:0.5:5:600
#    RRA:MAX:0.5:30:700
#    RRA:MAX:0.5:120:775
#    RRA:MAX:0.5:1440:797

for what in 5.1.66.255 185.150.99.255 80.241.218.68 159.69.114.157 176.9.93.198 176.9.1.117 94.140.14.14 94.140.15.15 94.140.14.140 94.140.14.141 95.215.19.53 193.110.81.0 185.253.5.0 193.110.81.9 185.253.5.9; do
  /usr/bin/rrdtool create data/dnsping_${what}.rrd \
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
done

