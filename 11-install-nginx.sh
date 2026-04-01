#!/bin/bash
user=$(id -u)

if [ $user -ne 0 ]
then
    echo "please Login with Root access..."
    exit 1
else
    echo "you are root access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not installed...going to install now"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "MySql Install is.... Success"
    else
        echo "Installing Mysql is ....Failure"
    exit 1
    fi
else
    echo "Already Installed MySql ... Nothing to do"
fi