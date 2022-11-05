# CRONTAB

The crontab is a list of commands that you want to run on a regular schedule, 
and also the name of the command used to manage that list.

For creat a crontab we start with this command:
```
crontab -e
```
If we want to see our crontab we run 

``` 
crontab -l
```
If we want to remove a crontab run
```
crontab -r 
```

Then we following this structure, we creat the crontab:
```
minute(s) hour(s) day(s) month(s) weekday (s) commands/script
```
For example:
```
58 2 30 11 6  /root/my_website_bakup.sh
```
This symbol " * " represent all the possible unit for example:

```
58 2 30 * 6  /root/my_website_bakup.sh #This means yje meaning, that is for every month.
58 2 30 * *  /root/my_website_bakup.sh #Every weekday and month.
58 2 * * *  /root/my_website_bakup.sh #Every month, weekday, day.
58 * * * *  /root/my_website_bakup.sh #Every month, weekday, day, hour.
* * * * *  /root/my_website_bakup.sh #Every month, weekday, day, hour and minute.
```
Suppose we want to do a crontab in two times on a day, like 9:00a.m. and 21:00 p.m.
```
0 9,21 * * * /root/my_website_bakup.sh
```
Schedule a crontab to execute on every two hours
```
0 */2 * * * /root/my_website_bakup.sh
```
here are special cases in which instead of the above 5 fields you 
can use @ followed by a keyword — such as reboot, midnight, yearly, hourly.

```
@yearly 
@monthly
@weekly
@daily
@hourly
@reboot #Is useful fot those tasks which you want to tun on your 
system.
```
NOTA: crontab.guru (here we can get our crontab)
