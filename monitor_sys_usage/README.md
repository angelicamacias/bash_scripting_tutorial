we want to monitor the file system and sanding a mail alert if the file system passes more than 40% full


if we run the command *df -Ph** we will get information about the files system:
``
$ df -Ph
Filesystem            Size  Used Avail Use% Mounted on
C:/Program Files/Git  459G  104G  356G  23% /
G:                     15G  7.0G  8.1G  47% /g
```
NOTE: For remove files we can run

````
df -Ph | grep -vE "Filesystem|tmpfs|none <--- here can add any file that you don't want. 
```
so we want to send a mail alert when the porcentaje is greater that 40%, the used field
number 5, we need to extract that data in this way: 

```
awk '{ print $5}' #we are calling the fidel 5 | sed 's/%//g' #remove-> %
```

```
#!/bin/bash

df -Ph | grep -vE "Filesystem" | while read line
do

        file_name=$(echo $line | awk '{ print $1}') #for the name of the file
        file_usage=$(echo $line | awk '{ print $3}' | sed 's/%//g')
        echo "file sys name: $file_name, file sys usage: $file_usage"
        sleep 2
done
```
