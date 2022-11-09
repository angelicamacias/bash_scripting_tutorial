# REMOTE SERVER

Using the command **ssh** you can connect with your remote server or you can login and be a remote server from your local, for doing that, need a username and password with IP for can login and do that by using would be terminal.

![sshdiagram](https://user-images.githubusercontent.com/114703394/200713320-b180ee05-18a0-4a31-9127-5e75f0b58712.png)

**For do it that we have two ways:**

### 1.- Using password or password authentication 

So if you wanto to login with you remote server from your local server, then you have to use command ssh, in your remote server username with what username you want to connect with your remote server or simply username and then remote server IP using password:
```
						ssh user_name@remote iP
```
And after that if you enter, it will prompt for password, you have to provide a password fot this username on your remote server so that you’re using it so you can able to log into that server. 

*Example:*
So we wanto to login with the remote server using:

```
[atomation@ip-172-31-94-102~]$ ssh testuser@54.197.76.200
```
Here we have: ssh command then the username from the remote server then *@* for last the IP. After run that we have to provide the password

```
[atomation@ip-172-31-94-102~]$ ssh testuser@54.197.76.200
testuser@54.197.76.200’s password:*********
Last Login: Mon Nov  2 13:42:46 2022 from 3.84.199.94
[testuser@ip-172-31-94-102~]$          #Here we can see that the username changes automation--->testuser 
```
so that you can login with the password. For out from the remote just run **exit** 


We can also login to remote server without username, in this way:

```
ssh remote_ip (here remote user name is same as local teminal user)
```

The conditions that ssh will take the default username a the user which we are using on our local, and we will get: 

```
[atomation@ip-172-31-94-102~]$ ssh testuser@54.197.76.200
**automation** @54.197.76.200’s password:*********
```


**NOTE**: vi /etc/ssh/sshd_cofig (Make it; PasswordAuthentication yes) if it’s dosen’t connectwith it from your local server. 

### 2.- Using passwordless

We need to generate a ssh key:

```
[atomation@ip-172-31-94-102~]$ ssh-keygen
generatin public/private rsa key pair. 
Enter file in which to save the key (/home/automation/.ssh/id_rsa):
crated direcotry ‘/home/automation/.ssh’. 
Enter passphrase (empty for no passphrase):
Enter same passphrase again: 
etc.. 
etc..
```
With this we will create the direcoty on you local server **.ssh**  into this directory we will get two files: 

```
[atomation@ip-172-31-94-102.ssh]$ ls 
id_rsa id_rsa.pub
```
The *private* is: id_rsa
The *public* is: id_rsa.pub 

If you want to work with your remote server first, you need to changes this key **id_res.pub** with your remote server, with respecto to your required username, this means if you want to work with the best user on the remote server. 

we wanto to login with my remote server **testuser** without password, so:

```
[atomation@ip-172-31-94-102.ssh]$ ssh-copy-id testuser@54.197.76.200 (<-- IP)
text...
text...
Are you sure you want to continue connecting (yes/no)? ** yes **
text...
text...
automation@54.197.76.200’s password:

#Then says to you that you are giving your key as

Number of key(s) added: 
 
Now tray logging into the machine, with: “ssh ‘testuser@54.197.76.200’”
and check to make sure that only the key(s) you wanted were added. 
```
Then we have to go to the remote server

```
[root@ip-172-31-88-242 ec2-user]# sudo su testuser
[testuser@ip-172-88-242 ec2-user]$ cd
[testuser@ip-172-88-242]$ ls -a 
. .. .bash_history .bash_logout .bash_profile .bashrc .ssh
[testuser@ip-172-88-242]$
```
So nobody is tating your key with your remote server on. The remotes are also not associated with ssh directly, this means:

```
[testuser@ip-172-88-242]$ ls
authorized_key 
[testuser@ip-172-88-242 .ssh]$ cat authorized_key
ssh-rsa DGAfvhadofgihbdfnjkvbhdpifgho’dng;isdfhnsdifijsdmflv;daghvpaeh;gnvk/iSEFADRGHBFDBARTHTGDFegraehnrgb
aegdfavdb;/’”Orihfda;lvhiubjkerlgmd’fpv;jba knelrmfd’oiui
[testuser@ip-172-88-242 .ssh]$
```
This is the key publicly, which we ahre from a local server to remote server. Once you share your keys with your remote server if you use **ssh** with your partner user:

```
[automation@ip-172-88-242 .ssh]$ ssh-copy-id testuser@54.197.76.200
Last Login: Mon Dec 2 14:15:36 2022
[testuser@54.197.76.200~]$
```
Then you don’t need to provide password, directly login and see that now we are within, without asking password. 


## EXECUTING COMMANDS ON REMOTE SERVER

We are using ssh to execute our commands on remote server, for do it that we have two ways to execute your commands on remote server using **ssh**, and these two ways are applicabrle for you were both password and password les authentication environments. 

### First way: 

1.- Login into your remote server 

```
ssh user-name@remote_server
```
2.-Provide the password if it is password authentication connection.
3.-Now run the commands and see the result
4.-Run exit command to close remote session 

NOTE: This is not good for automation 


### Second way:
1.- ssh user_name@remote_server “command”
2.- Provide the password if it is password authentication connection 
```
[automation@ip-172-88-242 .ssh]$ ssh automation@54.91.148.214 “date”
automation@’54.91.148.241’s password:
```

But this isn’t good for have automation, so we will to automate to connect with the remote server. So...

If you try to connecto for first time, then it will to ask:
				
				Are you sure you wanto to continue connecting (yes/no)?

But we don’t wanto to give that information, we want to login without the “ask confirmation”, we anto to make it as by default the answer be *yes*. For doing that we need run **man ssh**

```
[automation@ip-172-88-242]$ man ssh 

#here we will go to the option **-o** and copy the option:

“StrictHostKeyChecking”
```

So if we want that by default the answer be *yes* por the confirmation question then:

```
[automation@ip-172-88-242 .ssh]$ ssh -o StrictHostKeyChecking=No automation@54.91.148.241
```
With the *No* we say “don’t ask”, but will keep asking for password, if we run this we will get: 

```
[automation@ip-172-88-242 .ssh]$ ssh -o StrictHostKeyChecking=No automation@54.91.148.241
Warning: Permanently added ‘54.91.148.241’ (ECDSA) to the list of known hosts. 
automation@’54.91.148.241’s password: 
```
So all the output from this line “ssh -o StrictHostKeyChecking=No automation@54.91.148.241 “date”" can be assigned to a variable:

```
$ server_1_date=$(ssh -o StrictHostKeyChecking=No automation@54.91.148.241 “date”
Tus Nov 11 04:32:25 UTC2022
```
And we can put all the standar output by this variable in a file for this way:

```
$ server_1_date=$(ssh -o StrictHostKeyChecking=No automation@54.91.148.241 “date” > server1_info.txt
Tus Nov 11 04:32:25 UTC2022
```
In the same way but using “ >> “ you can put another command into the same file, we will use “ >> “ because we want to keep the other command that we put in the file:

```
$ server_1_date=$(ssh -o StrictHostKeyChecking=No automation@54.91.148.241 “uptime >> server1_info.txt
password: (privide the password)
```
So if we see the content into the file “server1_info.txt” we will see the date and uptime:

```
~$ cat server1_info.txt 
Tus Nov 11 04:32:25 UTC2022
04:32:25 up 2:30, 0 users, load average: 0.25, 0.12, 0.05
~$
```

It’s important to mention that in some commands, we need an interaction with the remote server, for that commands we had to privide one more option for what that is called **-t**

```
$ ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 “top”
password|:
info top
connection to 54.91.148.241 closed. 
~$
```
And after run the commands this is closing the session.

**NOTE** : The problem here is that always need to provide the password and the command that we will need, for resolver this problem we will creat the next code. 


## PROVIDING PASSWORD FOR SSH USING SSHPASS 

Using sshpass we can provide password, this just assum that your environment is password authentication.This means whenever if you’re trying to login into remote server from you local server it needs a password:

```
$ ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 “date”
password:
```
-t: For the command that need interaction with the remote server.
-o: For call the command StrictHostKeyChecking
-StrictHostKeyChecking=No : For remove the ask for login in remote server 
-“date”: the command that we want to run 

For automate the step where we provide the password with **sshpass**

We can to use this in many ways: 

## option -p

We can to run this command and see all the options, in this cease we will use the option **-p** because with this options we can provide password as argument, so the line command will:

```
~]$ sshpass -p “automation@123” ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 “date”
Tus Nov 11 04:32:25 UTC2022
connection to 54.91.148.241 closed. 
```

After the **shhpass -p** we need to provide password for the remote server, and if we run that we will see that don't ask for a password. 
 
## option -f 

Another way is to provide a file, where is the password of the remote server.

Firs we need to create a file that have the password of remote server. 

```
~]$ vi pass
      |
      |
      V
automation@123
```
So now we need the option **-f** because the line command can to read the file where is the password, it’s meas:
```
~]$ sshpass -f pass ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 “date”
Tus Nov 11 04:32:25 UTC2022
connection to 54.91.148.241 closed. 
```
## option -e

With this option we can to export the password in this way: 

```
~]$ export SSHPASS=“automation@123”
~]$ sshpss -e ssh -t -o StrictHostKeyChecking=No automation@54.91.148.241 “date”
Tus Nov 11 04:32:25 UTC2022
connection to 54.91.148.241 closed. 
```
With this option you have to provide a secure variable, you need to export as a variable, in this case is 
“sshpass”


**NOTE**: For install the command sshpss: yum install sshpass or sudo yum install sshpass ooor search the page
epel for rhel 8 beta


**Abstrac: In this point we can run any command for the remote server from our local server without the ask and password.**
