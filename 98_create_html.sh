#!/bin/bash

for what in 192.168.42.241 192.168.0.13 45.90.28.39 45.90.30.39 1.1.1.1 1.0.0.1; do
  cp -af index_192.168.0.1.html index_$what.html
  sed -i "s/192.168.0.1/$what/g" index_$what.html
  sed -i "s/src=ping_/src=dnsping_/g" index_$what.html
done

