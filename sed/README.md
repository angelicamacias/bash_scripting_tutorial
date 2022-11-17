# sed command

## introduction to sed command 

What is sed? 

sed command stands for stream editor, that means it is an a editr which is used to work on the stream of data, if the data meaybe from your file or from the output of any command, so we can use **sed** comman like an editor to work with any output comes from the any command or a file. 

sed command perform lot's of function on file like: 

 1) **Viewing file content**
      You can review the content of your file, like a cat command  

 2) **Seraching** 
      We can search particual words or pattern 

 3) **Find and replace** 
      We can replace a particular word

 4) **Isertion or deletion** 
      If we cant to delete some lines or we want some content of the file, we cant delete or insert new data. 

Sed also supports regular expression which allows it perform complex pattern matching 


**NOTE:** Avantage of sed over vi/vim editors: 
 
   Editor files withoutp opening it. 


### Syntax for sed command: 

```
sed [options] commands [file-to-work-with-sed]
```

### How sed works? 

diapositivaaaaa 10!!!!!!!!!!!!!!!!!!

So the command sed read line by line from your input on each and every line, executing each command from the syntax of sed, if the first line have success then it is displaying the result on the terminal, the same for any line into the file or command.  

### Functions


 1) **Viewing file content**

- print 

Viewing file content and delting file content based on line numbers. First we will see the command sed without options: 

```
sed '' file-to-work-with-sed
```
this syntax will work like a cat command. 

Fot the next examples we will work with this file:  
```
filename: ad.txt
This is first line 
This is second line 
This is third line 
This is quarter line 
This is fifth line
This is sixth line
```
we can use the option **p** into the quotations, and we will get each line twice. 

```
~]$ sed 'p' ad.txt 

1 This is first line 
1 This is first line 
2 This is second line 
2 This is second line
3 This is third line
3 This is third line
4 This is quarter line 
4 This is quarter line
5 This is fifth line  
5 This is fifth line
6 This is sixth line
6 This is sixth line
```
This is becasue with the option **p** we print each line, and with the command **sed** the same way we can see each line into the file. For get just one time each line we have to use the option **-n**

```
~]$ sed -n 'p' ad.txt 

1 This is first line  
2 This is second line 
3 This is third line
4 This is quarter line 
5 This is fifth line
6 This is sixth line

```

if we want to see only some line in particular we will run **Nump** into the quotations, being **Num** the number of the line that we want to see, for example if we want to see the second line need to run **2p** :

```
~]$ sed -n '2p' ad.txt 
 
2 This is second line

```
for see the **last line** , in the case that we don't know the number of line we can run: 

```
~]$ sed -n '$p' ad.txt 
3 This is third line
```

If we want to see the **range** of lines, for this case we want to see the range of the line 1 and 2:

```	
~]$ sed -n '1,2p' ad.txt 

1 This is first line  
2 This is second line 
```
If we want to print from the line one and then 2 **lines more**:


```
~]$ sed -n '1,+2p' ad.txt 

1 This is first line  
2 This is second line 
3 This is third line
```
in the case that we want to print the line with the diferences between each of two from the first line:
```
~]$ sed -n '1-2p' ad.txt 
1 This is first line  
3 This is third line
5 This is fifth line
```

- delet 

For delte lines we use the option **d** for example ir we wanto to delt the last line: 
```
~]$ sed -n '6d' ad.txt 

1 This is first line  
2 This is second line 
3 This is third line
4 This is quarter line 
5 This is fifth line
```
for delet a rang of lines, in this case form third to last line: 
```
~]$ sed -n '2-4d' ad.txt 
1 This is first line  
2 This is second line 
3 This is third line
```
in another case we wanto to delet a rang form thir to fifth line: 

```
~]$ sed -n '3,5d' ad.txt 
1 This is first line  
2 This is second line 
6 This is sixth line
```
for delet form second line and then 2 lines more then:

```
~]$ sed -n '2,+2d' ad.txt 
1 This is first line  
5 This is fifth line
6 This is sixth line
```
if you want to **delete empty** lines then:

```
~]$ sed -n '/^$/d' ad.txt
```
**VERY IMPORTANTTTTT**

if you want to delte empty lines permanently: 
```
~]$ sed -i '/^$/d' ad.txt
```
2) searching file content 

So assume that we have some number of lines in some file and want to print the lines which are having the required word or we wanto to delte the lines which are having the required work. 

We have the next syntax for serach a specific word, between the **/word/**  we have to put the word that we are searching 

```
~]$ sed -n '/first/ ' ad.txt 
1 This is first line 
~]$ sed -n '/fifth/ ' ad.txt 
5 This is fifth line
```

for seach multiples commands we need the option **-e**:

```
~]$ sed -n -e '/first/' -e '/sixth/' ad.txt
1 This is first line
6 This is sixth line 
```

for delet a line with a specific word then, put the word beteween the **//** next that the option -d 

```
~]$ sed -n '/third/d' ad.txt 
1 This is first line  
2 This is second line 
4 This is quarter line 
5 This is fifth line
6 This is sixth line
```
- 3) Find and replace with sed command 

So if we want to replace some word we need to follow this syntax: 

```
~]$ sed 's/WordToReplace/NewWord/' filename.txt

```
for example if we want to raplace the word **fifth** for the word **miau** then: 

for this example we are going to work with the next file: 

file.txt
___________________
1 This is first line  
2 sdfa This is second line 
4 aaa This is quarter line 
5 ooo This is fifth line
6 eee This is sixth line

```
~]$ sed  's/this/miau/' ad.txt
1 miau is first line  #
2 sdfa This is second line 
4 aaa This is quarter line 
5 ooo This is fifth line
6 eee This is sixth line
```
with the option **s** is going to subsitute only the first occurred word in each and every line. For raplace every line with the option **g**
```
~]$ sed  's/this/miau/g'
 ad.txt
1 miau is first line  #
2 sdfa miau is second line 
4 aaa miau is quarter line 
5 ooo miau is fifth line
6 eee miau is sixth line
```
for change a exactly place 
```
~]$ sed  's/this/miau/2' ad.txt ---> we have to mention the place
for change the info into a file 
~]$ sed -i's/this/miau/2' ad.txt ---> mantion the place and with the option -i we can modify the file 
```
more:
sed 's/old/new/' file --> the first occured old word will be replacing with new word 
sed 's/old/new/g' file --> replace all old words with new word on each and every line 
sed 's/old/new/2' file --> replace second occured old word with new word
sed '/search/s/old/new/g' --> raplaces the old word with new word if that line consist of search word


4)insertion and delation with sed command 


**insert a new line (sed'line_noi' file_name)

a= after 
i= before
d= delet

for the next examples we will work with the next file: 
```
vi cats.txt

1 krity      21548
2 blanquito  12549
3 billy      58748
4 gris       75142
```
so if we want to add a line with the titles of each columns:

```
~]$ sed '1i CatNo catname croquettes' cats.txt 
catNo catname croquettes
1 krity      21548
2 blanquito  12549
3 billy      58748
4 gris       75142
```
so here we need mention the number of the line that we want to creat, then the information, for last the file name.If we want to add this information into the file permantly we need to run the option **-i**
```
~]$ sed -i'1i CatNo catname croquettes' cats.txt 
```
If we want to add a line after another then 

```
~]$ sed '1a --------------' cats.txt

catNo catname croquettes
--------------  #after the line 1
1 krity      21548
2 blanquito  12549
3 billy      58748
4 gris       75142
```
for add a new data:

```
~]$ sed -i '/krity/i 0 Manchitas 78454' cats.txt

0 Manchitas  78454
1 krity      21548
2 blanquito  12549
3 billy      58748
4 gris       75142
```
i- : for modify the file 
/krity/: for indicate bbefore that...
i: insert
0 Manchitas 78454: new data
cats.txt: file 

for del /d, for after /a
