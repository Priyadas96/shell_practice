#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Error:: Please login with root access"
    exit 1
else
    echo "you are root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySql is not Install...going to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing MySql is......Success"
    else
        echo "Installing Mysql is......Failure"
    exit 1
    fi  
else
    echo "MySql is already Installed...nothing to do"
fi
