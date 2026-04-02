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
if [ $? -eq 0 ]
then
    echo "Info :: Mysql not available....Mysql going to be installed now "
    exit 1
else
    echo "Mysql already Installed...!"
fi