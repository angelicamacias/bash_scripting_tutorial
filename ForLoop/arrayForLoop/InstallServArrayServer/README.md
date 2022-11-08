In this example we want to sent a mail massage if the services into the array don’t are running. So in the 
first conditional we are testing if the last command ($?) had success, if this didn’t have succes then the 
code will proceed to send a mail alert. 

For that we need to know the directory of mail command, for know this we run **which mail**
``
~$ which mail 
/user/bin/mail
``` 

If we want to send a mail alert in a specific time, we need to use a crontab, for do it need create a crontab so 

```
~$ crontab -e  #maybe we will need sudo privileges ---> sudo crontab -e 
```
we need to remember that for create a crontab we know the direcotry and places in in a file named for your
current user name (/home/automation/practice/monitoryservies.sh). So, in this case we are programing a crontab for senad an alert massage every minute, hour, day, month, etc.

```
* * * * * /home/automation/practice/monitoryservies.sh
```
