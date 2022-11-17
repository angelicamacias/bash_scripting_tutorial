
Digital clock 


Here we are going to design a digital clock with shell script.


we can get the time with the command **date***
```
~]$ date
Tue Nov 15 11:03:15 HMM 2022
```
For this case we want only get the hour so:

```
~]$ date '+%T'
11:03:15 
```
so the clock it's chaging every second, for that we need to see the changes every second, so we added 
the command **sleep** for one second, then we have again the command date and this will be execute, then 
after 1 second, again the date. 

```
$ date '+%T';sleep 1; date '+%T';sleep 1; date '+%T';sleep 1
11:10:02
11:10:03
11:10:04
```
having this we can start with the shell script:


```
#!/bin/bash 
 
date '%T'  #from the command date we are selecting only the hour
sleep 1    #we are sleeping for 1 second before run the next command" 
date '%T'
sleep 1
-again 
````
Having this we still have the result for all the commands, it means in the terminal 
we see all the result like: 
```
11:10:02
11:10:03
11:10:04
```
but we want a digital clock, for that we need delet the last result and just see
the actually time, for get that we can use the command **clean** :

```
#!/bin/bash 
 
date '%T'  #from the command date we are selecting only the hour
sleep 1    #we are sleeping for 1 second before run the next command" 
claen      #we are deleting the result the last command. 
date '%T'
sleep 1
claen
-again 
```

the problem here is that need to write every command infinity times for stilling get 
the change of the time, so: 

```
#!/bin/bash

clear

while :
do
        date '+%T'
        sleep 1
        clear
done
```
but we want to put cute the digital clock, for that we can use colors. We select the color:

Purple='\033[0;35m'
