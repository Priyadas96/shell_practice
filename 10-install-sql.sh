#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Error:: Please login with root access"
else
    echo "you are root access"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Success:: Installing Mysql server Success"
else
    echo "FAIL :: MySQL server not Installed"
    exit 1
fi