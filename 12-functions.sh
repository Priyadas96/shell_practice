#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Error :: Please login with root access"
    exit 1
else
    echo "Root user loggedIn"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Info :: Mysql not available....Mysql going to be installed now "
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Mysql Server Installation :: Success"
    else
        echo "Mysql Server Installation :: Failure"
        exit 1
    fi
else
    echo "Mysql already Installed...!"
    exit 1
fi