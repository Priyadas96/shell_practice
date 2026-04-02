#!/bin/bash

userid=$(id -u) #root - 0 and non-root 1-136

if [ $userid -ne 0 ]
then
    echo "Please login with root access."
    exit 1
else
    echo "Root user LoggedIn"
fi

#Mysql Installation
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not available....trying to install now"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "Mysql Installation :: Success"
    else
        echo "Mysql installation :: Failure"
        exit 1
    fi
else
    echo "Mysql already installed"
fi

#Python Installation
dnf list installed python
if [ $? -ne 0 ]
then
    echo "Python not available...trying to install now"
    dnf install python -y
    if [ $? -eq 0 ]
    then
        echo "Python Installation :: Success"
    else
        echo "Python Installation :: Failure"
        exit 1
    fi
else
    echo "Python is already installed"
    exit 1
fi

#Nginx Installation
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx not available.. trying to Install now"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "Nginx Installation : Success"
    else
        echo "Nginx Installation : Failure"
        exit 1
    fi
else
    echo "Nginx already installed"
    exit 1
fi