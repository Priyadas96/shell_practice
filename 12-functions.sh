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
else
    echo "Mysql already Installed...!"
    exit 1
fi