#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
Z="\e[0m"

userid=$(id -u) #root - 0 and non-root 1-136

if [ $userid -ne 0 ]
then
    echo -e "$Y Please login with root access. $Z"
    exit 1
else
    echo -e "$G Root user LoggedIn $Z"
fi



validate(){
 if [ $? -eq 0 ]
    then 
        echo -e "$2 Installation :: $G Success $Z"
    else
        echo -e "$2 installation :: $R Failure $Z"
        exit 1
    fi
}

#Mysql Installation
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "Mysql not available.... $Y trying to install now $Z"
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "$G Mysql already installed $Z"
fi

#Python Installation
dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "Python3 not available...$Y trying to install now $Z"
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "$G Python3 is already installed $Z"
fi

#Nginx Installation
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "Nginx not available.. $Y trying to Install now $Z"
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e "$G Nginx already installed $Z"
fi