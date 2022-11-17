
Inventory is serves for collect some hardware information of your system, some software inofrmation of 
your system or combination or your software and hardware information or your system. 

For this case we want: 

- Server name 
- ID address
- OS Type 
- uptime 

the recoleccion of this data is an inventori 


After getting all the information, we want to export that data inventory result into cvs file. 

we want to have the 4 points for all the server that we have. 

we will to start getting the last 4 points for 1 server, after that we have the script for multiples 
servers. 

```
#!/bin/bash
Se





```
server_name: 

the first point is the server name, for get that information we can use the command **uname** 

```
server_name=$(uname -n)
```

ID_addres: 

Whit the command **ifconfig** we can get the IP addres, but the problem here is that we need to extract
the data from all the information prited on the terminal: 

```
IP_Addres=$(ifconfig | grep inet | awk 'NR==1{print $2}')
```
- OS_Type:

```
OS_Type=$(uname)
```

- up_time:
The next comman help only for extract the hour: 

```
uptime=$(uptime | awk '{print $3}')
```

So we have the commands for get the information servers, but let's remember that we want to put all the 
informatio from each command in a file so: 

```
#creating header in csv file 

echo "S_No,Server_Name,IP_Address,OS_Type,Uptime" > server_info.csv
```
how we will get all the information print on a table, for know what type of information we get in each 
column we create another echo: 

```
echo "1,$Server_Name,$IP_Address,$OS_Type,$UP_time" >> server_info.csv  # we need to use **>>** for not delet the other information. 
```
the result will be:

```
~]$ cat server_info.csv

S_No,Server_Name,IP_Address,OS_Type,Uptime
1, ip-172-31-87-229.ec2.internal,172.31.87.229,Linux,1:09,
```

**NOTE:** If you export this into your windows are anywhere, and if you open that with your Excel then 
automatically, your data will be rearranged dumpos of rows and columns.
