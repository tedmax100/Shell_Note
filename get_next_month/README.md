# date
```bash
date [OPTION]... [+FORMAT]
date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
```
options
- -d --date 
    to display past or future dates in Linux
    ago : paste dates
- -u 
    utc time

sample
```bash
# display yesterday
date -d '1 days ago' "+%Y-%m-%d"                                  
> 2022-01-05

# 10 minutes ago
date -d '10 minutes ago' "+%Y-%m-%d:%M:%S"
> 2022-01-06:12:38
```
```bash
# display tommorowd
date -d '-1 days ago' "+%Y-%m-%d"
> 2022-01-07
date -d '1 days' "+%Y-%m-%d"
> 2022-01-07

# 10 minutes later
date -d '-10 minutes ago' "+%Y-%m-%d:%M:%S"
> 2022-01-06:12:38
```

```bash
# display epoch
date +%s
> 1641464683
```

# getopts + OPTARG