#!/bin/bash

userid=$(id -u) #root - 0 and non-root 1-136

if [ $userid -ne 0 ]
then
    echo "Please login with root access."
    exit 1
else
    echo "Root user LoggedIn"
fi

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

   