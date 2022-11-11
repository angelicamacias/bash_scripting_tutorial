
======> Shell script to execute different commands on differents servers with different users and different
password 



So we wanto to execute same commaent on different servers with the same username and password. In the last code 
of “ Executing multiple commands on multiple servers “ we have this for loop: 

```
for each_ser in $(cat remote_servers.txt) 
do 
	echo “Executing cmd on $each_ser”
	echo “===========================”
	
	for each_cmd in date uptime “free -m”
```
The commands taht are **DECLARADOS** here are executing on multiple servers with the same username and password, and 
we are executing the same commands for every remote servers. 

So in this case we want to execute differents commands, and username and the passwords are differet: 


fiel: server_info.txt:

18.212.27.210 automation automation@123 date
18.212.185.2 tomcat tomcat123 whoami


we will use a while, we know that into the fiele “server_info.txt we have 4 values:
server, user, password, command, so into the while we can name each, it’s means:

```
while read ser user pass cmd 
do 
	statemants/commands

done < servers_info.txt
```
We select this names making references the type the information. Well, after de declare 
each variable we can modify the command line, it’s means:

```
	sshpass -f pass ssh -o StrictHostKeyChecking=No automation@each_serv “$each_cmd”					
							
							for
 
	sshpass -p $pass ssh -o  StrictHostKeyChecking=No $user@$ser “$cmd”
```

So, now the code will be:


```
#!/bin/bash

while read ser user pass cmd1 cmd2
do 
	echo “Executing $cmd1 on $ser whith user as $user and password $pass”
	sshpass -p $pass ssh -o  StrictHostKeyChecking=No $user@$ser “$cmd”
	echo”---------------------------------------------------------------”
	echo “Executing $cmd2 on $ser whith user as $user and password $pass”
	sshpass -p $pass ssh -o  StrictHostKeyChecking=No $user@$ser “$cmd”
	echo “==============================================================”
done < server_info.txt
```


