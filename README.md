<sup>This project is suitable for:</sup>
[![Linux](https://img.shields.io/badge/os-Linux-blue)](https://en.wikipedia.org/wiki/Linux)
<sup>+</sup>
[![macOS](https://img.shields.io/badge/os-macOS-blue)](https://en.wikipedia.org/wiki/MacOS)
<sup>and has been</sup>
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
<sup>+</sup>
[![Vim](https://img.shields.io/badge/--019733?logo=vim)](https://www.vim.org/)
<sup>+❤️</sup>

# DNS-Ping Monitoring with real data from my home
This project implement a nice monitoring of average response times of DNS resolvers based on [dnsping](https://dnsdiag.org/) in RRD databases and simple HTML pages with PNG graphs. With these information you can decide which DNS resolver to choose for performance reasons.  

⚠️  In contrast to [https://github.com/thomasmerz/dnspingtest_rrd](https://github.com/thomasmerz/dnspingtest_rrd) this repo contains "real data" from my Linux server **at my home** (pushed nightly or on request).  

📈 **So all you have to do is: clone this repo and have a look on the HTML pages you are interested in:**  
- Dashboards with all DNS resolvers on a hourly/daily/weekly/monthly/yearly base or  
- all-in-one for each DNS resolver.  

📈 **Or use the direct links to my dashboards:**  
- [Dashboard for yesterday](https://thomasmerz.github.io/dnspingtest_rrd_ka/dashboard_day.html)
- [Dashboard for the last seven days](https://thomasmerz.github.io/dnspingtest_rrd_ka/dashboard_week.html)
- [Dashboard for the month](https://thomasmerz.github.io/dnspingtest_rrd_ka/dashboard_month.html)
- [Dashboard for the year](https://thomasmerz.github.io/dnspingtest_rrd_ka/dashboard_year.html)

⚠️  All data is currently updated on a daily base at 3am.

These DNS resolvers are currently monitored:
```
# 80.69.96.12 = vodafone-extern
# 192.168.42.241 = merz-nimbus/localhost ("LAN")
# 192.168.0.13 = via tp-ax6000-router ("WLAN")
# dns1.nextdns.io 45.90.28.39
# dns2.nextdns.io 45.90.30.39
# dns1.nextdns.io 45.90.28.241 from https://my.nextdns.io/setup
# dns2.nextdns.io 45.90.30.241 from https://my.nextdns.io/setup
# Google (ECS, DNSSEC);8.8.8.8;8.8.4.4;2001:4860:4860:0:0:0:0:8888;2001:4860:4860:0:0:0:0:8844
# OpenDNS (ECS, DNSSEC);208.67.222.222;208.67.220.220;2620:119:35::35;2620:119:53::53
# DNS.WATCH (DNSSEC);84.200.69.80;84.200.70.40;2001:1608:10:25:0:0:1c04:b12f;2001:1608:10:25:0:0:9249:d69b
# Quad9 (filtered, ECS, DNSSEC);9.9.9.11;149.112.112.11;2620:fe::11;2620:fe::fe:11
# --
# https://www.privacy-handbuch.de/handbuch_93d.htm
# "Die DNS-Server vom CCC (213.73.91.35) und Digitalcourage e.V. (85.214.20.141) empfehle ich nicht, da diese Server kein DNSSEC zur Validierung nutzen."
# Der CCC listet "seinen" eigenen/o.g. DNS-Server selber nicht mehr auf seiner Seite: https://www.ccc.de/censorship/dns-howto/ -- Offline/Down/ABN?!
# 46.182.19.48 (Digitalcourage)
# 194.150.168.168 (AS250.net)
# --
# 5.1.66.255 Freifunk München zensurfrei, DNSSEC
# 185.150.99.255 Freifunk München zensurfrei, DNSSEC
# 116.203.32.217 dismail.de
# 159.69.114.157 dismail.de
# 176.9.93.198 dnsforge.de
# 176.9.1.117 dnsforge.de
# 94.140.14.14 AdGuard MIT Werbe- und Trackingfilter
# 94.140.15.15 AdGuard MIT Werbe- und Trackingfilter
# 94.140.14.140 AdGuard OHNE Werbe- und Trackingfilter
# 94.140.14.141 AdGuard OHNE Werbe- und Trackingfilter
# 95.215.19.53 Njalla  unzensiert (Njalla ist ein privacy-fokusierter, schwedischer Domain-, Hosting- und VPN-Provider)
# 76.76.2.38 76.76.2.39 free DNS resolvers to immediately start using 1Hosts 
# ⚠️  1Hosts switched from standard UDP to TCP on Feb, 1st, which can be checked by simply adding a "-T" directly to the server-IP
# 185.236.104.104 and 185.236.105.105 = FlashStart Malware- und Inhaltsfilter-Testversion (Private)
# 86.54.11.1 joindns4.eu Protective Resolution
# 86.54.11.13 joindns4.eu Protective + Ad blocking
# 86.54.11.100 joindns4.eu Unfiltered Resolution
# https://dns01.eddns.eu/
# dns01.eddns.eu: 135.181.207.105
# dns02.eddns.de: 89.58.62.53
# dns03.eddns.eu: 138.199.237.109
```

⚠️  If you want to know what the following **scripts** are doing and how to integrate into your **crontab**, please have a look in [https://github.com/thomasmerz/dnspingtest_rrd](https://github.com/thomasmerz/dnspingtest_rrd)!

```
01_dnsping.sh
02_dnsping-graph.sh
```

Have fun!

