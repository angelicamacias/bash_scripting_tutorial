## What is an array?
 
An Array is the data structure of the shell which is used to sotre multiple letters or simply. An array using some
kind of variable which is used to store multiple data or multiple values. 

Simple array:

```
myarray=( ls pwd date 2 5 .6 )
``` 	

Between that, you have to write all your values and each and every value has to be separated with the space, don't
use commas, and you can store any number of values into one.   
In this case 
```
myarray=("ls -lrt" "hostname -s")
```

How between the command *ls -lrt* we have a space the array would read two values *ls* and *-lrt*, for that we need use *""* with
this the arrey would read like an one value.

And we can also declare our array explicitly by using the clear command, so just declare. (NewArray is a variable name)
```
declare -a NerArray
NewArray=(1 2 3 4 5 bash scripting) 
```
## How to access array values?

Bash Shell array is the zero base, this means indexing start with zero. This means:
If we have this array 
```
myarray=(23 4 5 6 8)
```
For this values inside tha arrey have a possition, this possition assing this way: 

```
                   23              4             5               6             8
		Possition 0	Possition 1	Possition 2	Possition 3	Possition 4
```
So Bash Shell give a value to the positions for each and avery data inside the array staring with zero. 

For display all the values inside the array, so in that case, this syntax to print all the values inside the array. 

```
~ x =(3 5 6.7 "ls -lrt")
~ echo "${x[ * ]}"
3 25 6.7  ls -lrt

```
If we want to display only the value "6.7":

```
~ x =(6.7 )
~ echo "${x[2]}"
 6.7  
```
If we want to display all values of our array we use this syntax
```
~ x =(3 5 6.7 "ls -lrt")
~ echo "${x[@]}"
3 5 6.7  ls -lrt
```
If we want to display all values but only the last 4 values, that means after positon one:

```
~ x =(3 5 6.7 "ls -lrt")
~ echo "${x[@:1]}"
3 5 6.7  ls -lrt

~ x =(3 5 6.7 "ls -lrt")
~ echo "${x[@:3]}"
ls -lrt

#If we want a range of values. This represents start form position one *(:1)* and the next *(:2)* how many 
values you cant to bring from this.   
~ x =(3 5 6.7 "ls -lrt")
~ echo "${x[@:1:2]}"
5 6.7

#If we want to see the position values of array
~ x =(3 5 6.7 "ls -lrt")
~ echo "${!x[@]}"
0  1 2 3

#For know how many values we have
~ x =(3 5 6.7 "ls -lrt")
~ echo "${#x[@:1]}"
4
```
## How to store the commands output in a normal variable?

For store a commands output in a normal variable we need follow this syntax

				unset <nameArray>

But if we want update an existing array 

```
#With @ we call to all values 
~$ myarray=(1 2 3)
~$ Myarray+=(4 5 6)
~$ echo "${myarray[@]}"
1 2 3 4 5 6
```

## How to read array using read command?

So using -a and varable name, we can read multiples variables 

				read -a myarray

Thats means:

```
~$ read -a myarray 
1 2 3 4 5 
~ echo ${myarray[@]}    #Show all the values
1 2 3 4 5
 
#If we want to write some message
```
~$ read -p "Enter your array:" -a myarray 
Enter your array: 12 23 45 23 67
~$ echo "{$myarray[@]}"
12 23 45 23 67
```
