# DNS-Ping Monitoring with real data from my home
This project implement a nice monitoring of average response times of DNS resolvers based on [dnsping](https://dnsdiag.org/) in RRD databases and simple HTML pages with PNG graphs. With these information you can decide which DNS resolver to choose for performance reasons.  
In contrast to [https://github.com/thomasmerz/dnspingtest_rrd](https://github.com/thomasmerz/dnspingtest_rrd) this repo contains "real data" from my Linux server **at my home** (pushed nightly or on request). So you can clone this repo and have a look on the HTML pages you are interested in:  
- Dashboards with all DNS resolvers on a hourly/daily/weekly/monthly/yearly base or  
- all-in-one for each DNS resolver.  

⚠️  If you want to know what the following **scripts** are doing and how to integrate into your **crontab**, please have a look in [https://github.com/thomasmerz/dnspingtest_rrd](https://github.com/thomasmerz/dnspingtest_rrd)!

```
01_dnsping.sh
02_dnsping-graph.sh
98_create_html.sh
98_create_rrd.sh
```

Have fun!

