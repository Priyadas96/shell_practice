#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Please login with Root access."
    exit 1
else
    echo "you are a Root User"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx is not Installed...going to install now "
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "Nginx installation....:: Success"
    else
        echo "Nginx installation.....:: Failure"
        exit 1
    fi
else
    echo "Nginx already installed...Nothing to do"
fi
