
If you want to install any packages, you should be the root user or your current user should have religious. 

For that we are testing if we are the user, if we don't be the user, then show a message "Plase run from root user or with sudo privilage". So if you we want then 
the code stop in that moment, we will use the command **exit**. 

How we want to install any packages, and the process for do it is the same por any packages, we will use a for loop.

First we need declar the variable **each_pkc** who can take any value that we declare into the for loop. For know which
packages is installing we will print the name "current pkg: $each_pkc". Then how we can works with many packages
we are implementing **$@** fro call the packages that we write in the command line.

But if don't past any packages we will see the massage "Usage: $0 pkg1 pkg2" in the first conditional from our code, for to inform the user what type of data need the code, and then exit from the code, because don't have any packages name. 

Then into the for loop we are testing if the package already exist,  but we don't want to display error output, for that we use **&> dev/null** whit **&>**
we can redirects both normal output and errors to a file. In this case we are using "/dev/null" that means the output is discarded. 
So if we have success, this means the packages exist into the us local, we will print a message "Already $each_pkc is installed", but if we don't have success then the next option is intall the packages, and print "Installing $each_pkc".


Where the packages is installing we will get a lot of information, but we don't want everyhing for that we again will use **&> /dev/null**.

We want to know if the install did have succes, for check that we use the conditional if. In the first line we check if the last command it's means **yum install vim -y &> /dev/null** was success with the command **$?** we can have the success value the last command. So if he instalation is equal to 0, then print "Successfully installed $each_pkc", but if not print "Unable to install $each_pkc".


 
NOTE:For remove the packagesn *yum remove vim -y*

