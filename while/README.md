 # While loop syntax


### Different ways to use while loop:


Infinity while loop: 

```
	while true
	do 
		statemants/commands
	done 
```
or 
			    
```

	while:
	do
		statments/commands
	done
```

### While loop with command:

```	
	while command
	do 
		statements/commands
	done 
```
			or
```
	while [[ 3 -gt 5 ]]
	do 
		statements
	done 
```

In the real time, while is very usfuel for reding a file content: 


### Reading a file content:

```
	while read line
	do 
		statments/commands
	done < file_name 
```
**NOTE:** If you are reading the content of your file, while will read line by line, but the while can take any variable (line). 

But if you want to read any command output, then: 

### Reading command output:

```
	command | while read line 
	do 
		statements/commands
	done 
```
command: Command output.
line: this is the variable.
statements/commands: This can take any stataments. 


## While loop with IFS


**IFS**: Internal Field Separator, which is one of the shell of environment variable, this is used as a word separator (token) for the loops.

### While syntax with IFS:

```
	while IFS=“:” read field1 field2 field3
	do
		statments/commands
	done < file_name
```

with command

```
	command | while IFS=“:” read field1 field2 field3
	do
		statments/commands
	done < file_name
```



### Example:

We have a fiel:

```
[automation@ip-172-31-94-102 ~]$ cat servers_info.txt
100.26.187.33 automation atumation@123 uptime
54.208.63.88 tomcat tomcat123 whoami date
[automation@ip-172-31-94-102 ~]$
```
Here in each line we have a few commands, each command is separate for a space, so each command can take a number of files by using ISF by default ISF is the space.

```
#!/bin/bash

#nameTheFile: ifs_while_loop.sh

while read f1 f2 f3 f4  f5
do
	echo “$f2”
done < servers_info.txt
===============================================

[automation@ip-172-31-94-102 ~]$ ./ifs_while_loop.sh
automation
tomcat
```
We can see that the result is the username because we are calling the variable “f2” and this variable take the value for position two fo each line.

It’s important to declare that if we write the lines into the file in this way (the space with comas):


fiel: server_info.txt:

```
Server_IP,UserName,UserPassword,cmd1,cmd2
18.212.27.210,automation,automation@123,date
18.212.185.2,tomcat,tomcat123,whoami
```


run the last code

```
#!/bin/bash

#nameTheFile: ifs_while_loop.sh

while read f1 f2 f3 f4  f5
do
	echo “$f2”
done < servers_info.txt
============================================
[automation@ip-172-31-94-102 ~]$ ./ifs_while_loop.sh



````
The result will be anything, because by default, while will split the line into files based on space, so how we don’t have spaces then we are gatting anything.

For the while can to raed the information into the file, we have to mention in the while, with the **IFS**

```
#!/bin/bash

while IFS=”,” read f1 f2 f3 f4  f5
do
	echo “$f2”
done < servers_info.txt
========================
[automation@ip-172-31-94-102 ~]$ ./ifs_while_loop.sh
UserName
automation
tomcat
```

In this case that we don’t have the line 1 from the file “server_info.txt” , we can use the while who read command output:


```
cat servers_ingo.txt | awk ‘NR!=1 {print}’ | while IFS=”,” read f1 f2 f3 f4  f5
do
	echo “ $f1 $f2”
done
========================

[automation@ip-172-31-94-102 ~]$ ./ifs_while_loop.sh
Server_IP UserName
18.212.27.210 automation
18.212.185.2 tomcat
```

In another case if we jus declare 1 variable, but we call the variable $f2, the result will be all the information of each line.


```
#!/bin/bash

#nameTheFile: ifs_while_loop.sh

while IFS=”,” read f1
do
	echo “ $f1 $f2”
done < servers_info.txt
========================
[automation@ip-172-31-94-102 ~]$ ./ifs_while_loop.sh
Server_IP,UserName,UserPassword,cmd1,cmd2
18.212.27.210,automation,automation@123,date
18.212.185.2,tomcat,tomcat123,whoami
```

So if you aren’t pasing exactly number of files, then only the first field will assign, then the variable $f2 is getting all the files next of first.

**NOTE:** Is very importan reset the IFS, because we are changing the value.

```
#!/bin/bash

OLD_IFS=$IFS

while IFS=”,” read f1
do
	echo “ $f1 $f2”
done < servers_info.txt

IFS=$OLD_IFS
```
If we are going to change the default IFS, then it is a good practice to store the original IFS in a variable.
