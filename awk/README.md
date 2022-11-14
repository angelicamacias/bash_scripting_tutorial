CREAT A INDEXXXXX


# AWK 

## What is awk?

The awk command is programming language, which requires no compiling, and allows the user to use variables, numeric functions, string functions, and logial operatores.
The awk command in Unix is juts like a scripting language which is used for text processing. 


Example

If we are runing this command we will get all this information:
```
~]$ systemctl status httpd 
httpd.service - The Apache HTTP Server 
 Loaded: loaded (/usr/lib/systemd/system/httpd.service; disable; vendor preset: disabled)
 Active: Inactive (dead)
   Docs: man:httpd(8)
         man:apachectl(8)
~]$

```
But we don't to display all the information, we just wanto to get only the status, exactly ther it's inactive of active, this information is in:

-thir line
-second column 

for that we have to run: 
```
~]$ systemctl status httpd | awk 'NR==3 { pirnt $2 }'
Inactive
```

**NR==3** = third line 
**print $2** = print second places


## akw like command 


### syntax 

```
awk options 'pattern {action}' filename

#example

~]$ awk 'NR==3 { pirnt $2 }' demo.txt

```
or

```
commands | awk options 'pattern {action}' 

#example

~]$ systemctl status httpd | awk 'NR==3 { pirnt $2 }'

```

**action**: is a logic, siplme logic is pirnt "something"



Where the patterin indicates the pattern or the condition on which the action is to be executed for every line matching the pattern. In case of a pattern not being present, the action will be executed for every line of the file 

So **awk** also can used like *command* and like scripting language, both of them are very similar. 

**awk** like command in unix is most important command used to find and replace the text. 


So we put the command output into a file: 

```
~]$ systemctl status httpd > demo.txt
~]$ cat demo.txt 
httpd.service - The Apache HTTP Server 
 Loaded: loaded (/usr/lib/systemd/system/httpd.service; disable; vendor preset: disabled)
 Active: Inactive (dead)
   Docs: man:httpd(8)
         man:apachectl(8)
~]$

```
So awk reads data from a files or from it's standar input, and outputs to it's standar output:

```
~]$ awk 'NR==3 { pirnt $2 }' demo.txt
Inactive
```
Then, awk views a text file as records and fields, each line is record an columns in lines/record are called fields, so by default fields are separated based on spaces, and awk commands works an each line individually. 

**Note:** We can also change the fiels separator with -F option).

For example if we don't mention the line that we want to display 
```
~]$ awk '{ pirnt $2 }' demo.txt   #We removed the command NR==3
httpd.service 
Loaded
Inactive (dead)
man:httpd(8)
         
~]$

```
We will get all the fildes from place 2 from each cloumn, for that we are seeing awk command works on each line individually". and awk has its won predefined 
variables like $0, $1, $2... $n and NR, NF.

## awk command with action and basic variables 

Here we are going to execute awk command without options, pattern and action. 



- Basic variables:

	 $0, $1, $2... $n 

IMAGEEEEEEEEEEEEEEEEEEEEEEEN DIAPOSITIVA 7 


- NR: no of recrods 
imageeeeeeeeeeeeeeeeeen DIAPOSITIVA 8 
It will the record number 

- NF: no of fields 
IMAGEEEN DIAPOSITIVAaaaaaaa 8 

This actually is going to perform on each and every line. Who many fields hare into a file. The number of fields in each and every line. 

- Filename 

Will automatically identify the filed, which we are going to provide for your comment 

## Introduction to awk scripting 

Syntax for scrpting AWK: 

We have two ways:

First way: 
```
awk 'BEGIN {star_action} pattern/condition {action to perform on each line} END {stop_action}' filname 
```
Here:

- **BEGIN*** block is performed before reding the file. The action this is going to perfom on each and every line of our input. 

- **END** blocj is perfomed after processing the file. 

- Rest of the actions are performed while processing the file .

We can use anyone of them, some of them, all of them.  

** NOTE: **
- Need at last one action to run awk script. 
- NO need of input for BEGIN actions. 
- Input is required only for middle actions ande END actions. 


example: 

imaaageeeeennnn diapositiva 9 



BEGIN:
======== Working on /etc/passwd file =========
ACTION:

root:x:0:0:root:/root:/bin/bash 
operator:x:11:0:operator:/root:/sbin/nologin

END:
======= completd work on /etc/passwd file ========


-Second way: 

```
awk -f awk_script.awk filename
```


IMAGEEEEEEEEEEEEN 2 DIAPOSITIVA 9 IMAGEN 22222222


## awk command with options, action and basic variables 

Here will we see about a command with options and action. 

awk can take the sollowing options:
 
 - F fs to specify a field sepatator 
 - V var=value to declare a variable 
 - f file to specify a file that contains awk script 

 ### Option -F

So if we have a file separate with colons then we can use:

```
awk -F : '{ print $1 }' /etc/passwd 
```
This is the way how we can specify you are required to field separate for your command. 

```
~]$ echo "/home/ec2-user" | awk -F / '{ print $2 }' 
home
```


Here we want to print the word "home" for that we need to mention the separatior with the option -F then the characters in this case "/", then we need to call the possition where is the word with "$2", is the possition 2 because is after of separate.

### Option -v

For print a variable into the last commands we need the option **-v **:

```
~]$ echo "/home/ec2-user" | awk -F ec2 -v x=5 '{ print $2, x}' 
-user 5
```
So first we need to declare the variable and the value, then we need to call the variable into the "{}". If you want to declare one more variable, again need to use the option **-v**:

```
~]$ echo "/home/ec2-user" | awk -F ec2 -v x=5 -v y=6 '{ print $2, x,y }' 
-user 5 6
```

### Option -f


Here we want to execute the awk commands that are into a file for another file with text. It means: 

We have a file with this information: 

```
~]$ cat demo.txt
This is first line 
This is second line 
This third line 
```
So we want to get the cloumn 2 for each line, but another way to do that is saving the action into a file

```
vi action.awk
____________
{print $2}

```
Now we run the syntax using the oprion **-f** for execute the action from a file for get the information of each line of column 2 from the file demo.txt 

```
~]$ awk -f action.awk demo.txt 
is 
is 
is
`````
## Exercise: Simple Hello world awk script

This exercise is for show the ways to run a command awk. We wanto to print just a "Hello word" 

- The first way is using the shib line: 

First, we need to know the direcoty of the command awk, Because you are mentioning with what interpreter you want to run the script, so:

```
~] which awk 
/bin/awk
```
Knowing this we can creat our script: 

``` 
vi helloword.awk 
____________________

#!/bin/awk -f
BEGIN {
  pring "Hello world!!"
}
```
we have the script, we need to give the permission and then run the code:
```
~]$ chmod +x helloword.awk 
~}$ ./helloword.awk 
Hello World!!
```
For can run the script with this way "./" we need to put into the fiel the shib line, if don't have the **shib line**, then the script will not be able interpreter what do you want to run. 


- Second way without shib line: 

But we can also run the scritp in this way 

```
vi helloword.awk 
____________________

BEGIN {
  pring "Hello world!!"
}
____________________

~] awk -f helloword.awk 
Hello World!!
````
Without the shib line, because we are mentioning in the command line **awk** -f hellowrod.awk. 

## awk variables


- How to read variable values form command line? 


How to read variable values from command line or how to read variables values for your awk are different. We want to read **a** and **b** value using command, and we want to display that values. *How we can do that?* 

We need to provide input in ther of filename or in terms of commands: 

```
way 1: awk option ' pat/condition {} END {}' filename 
way 2: command | awk 'pat/conditoin {} END {}'
```
**NOTE:** The END is optional. 

- First case 
In the first case we will use the way 1 for see the values the this two variable: 

```
~]$ echo " 2 6" | awk '{ print "a=" $1, "b=" $2}' 
a=2 b=6
```
- Second case 
 
First in a file we save the values:

``` 
vi ab.txt
_______
2 6
````
then following the second way: 

```
~]$ awk '{ print "a=" $1, "b=" $2}' ab.txt
a=2 b=6
```
Here we have in a file the values 2 and 6, we are calling this values through the possitons, and the same time we are printing a massage before each value, "a=" and "b=". 

we can also print only the values: 
```
~]$ awk '{ a=$1 ; b=$2; print a,b }' ab.txt 
```
In this case we are declaring the values for "a" and "b", for see the results, we need the command *print* and then call the variables "a" and "b" so how we have multiples statments we need to separete with **;** 

Finally we have this case: 
```
~]$ awk '{ a=$1 ; b=$2; print "a="a, "b="b }' ab.txt 
a=2 b=6
```
Here in addition to call the variable we are giving a massage. So here we have 3 statments:

 statement 1: a=$1
 statement 2: b=$2
 statement 3: print "a="a, "b="b

and each statement is separate for a **;**, in the case that we add another line into the file "ad.txt" for example" 

```
vi ad.txt
________________
2 6
5 6
``` 
and then we run the file with the same command line, we will get: 

```
```
~]$ awk '{ a=$1 ; b=$2; print "a="a, "b="b }' ab.txt 
a=2 b=6
a=5 b=6
```
But now we will to create a script with this line command so we need to remember the syntax fot that:

```
awk -f aws_script file #Here we can not use the shib line because we have "awk -f" 
```
so the file will be:

```
vi display_a_b.awk
______________________
BEGIN {
}

{
a=$1
b=$2   #here we are writing our statements in multiple lines, for that we don't need to separate with ";" 
print "a="a , "b="b
} 

wq!
_______________________
#so now we run the scritp 

~]$ awk -f display_a_b.awk ab.txt 

a=2 b=6
a=5 b=6
```
but if we include the shib line we can run the sript in different way: 

```
vi display_a_b.awk
_________________________
#!/bin/awk -f   #shib line 
BEGIN {
}

{
a=$1
b=$2   #here we are writing our statements in multiple lines, for that we don't need to separate with ";" 
print "a="a , "b="b
} 

wq!
________________________
#so now we run the scritp 

~]$ chmod +x display_a_b.awk    #permission
~]$./display_a_b.awk ab.txt #we need to provide filename

a=2 b=6
a=5 b=6
```
### How to read variables for awk using shell script with read command?

```
#!/bin/bash 

read -p "Enter a value:" a
read -p "Enter a value:" b

echo "$a $b" | awk '{ x=$1 ; y=$2 ; print "x="x, "y="y }'

#suma

echo "$a $b" | awk '{ x=$1 ; y=$2 ; print "sum="x+y }'

#we can change the echo command for the option -v 

awk -v x=$a -v y=$b '{ print "sum="x+y }' file.txt  

#but the BEGIN block we dont need any file 

awk -v x=$a -v y=$b ' BEGIN{ print "sum="x+y }'  
```
