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
This project implements a nice monitoring of average response times of DNS resolvers based on [dnsping](https://dnsdiag.org/) in RRD databases and simple HTML pages with PNG graphs. With these information you can decide which DNS resolver to choose for performance reasons.  

💡 Some words about **latency** from [HaGeZi DNS](https://github.com/hagezi/dns-servers/?tab=readme-ov-file#latency):

> **DNS resolution reference values (ms):**
> | DNS resolve / lookup time (ms) | Rating | What it usually means |
> |---:|---|---|
> | < 20 | Excellent | Very fast response, often due to a nearby resolver and/or a warm cache. |
>| 20–50 | Very good | Common target range for good user experience. |
>| 50–100 | OK | Usually fine, but can add noticeable delay if a page triggers many lookups. |
>| 100–120 | Average | Often cited as the upper end of “average” DNS lookup time. |
>| 120–200 | Slow | Suggests distance, routing/latency, resolver load, or extra resolution steps. |
>| > 200 | Very slow / problematic | Frequently indicates a real performance or reachability issue (retries/timeouts/overload). |

💡 Please have a look at [dnsresolvers.list](dnsresolvers.list) for all DNS resolvers that are currently monitored.

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

⚠️  If you want to know what the following **scripts** are doing and how to integrate into your **crontab**, please have a look in [https://github.com/thomasmerz/dnspingtest_rrd](https://github.com/thomasmerz/dnspingtest_rrd)!

```
01_dnsping.sh
02_dnsping-graph.sh
```

Have fun!

