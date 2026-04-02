#!/bin/bash

userid=$(id -u) #root - 0 and non-root 1-136

if [ $userid -ne 0 ]
then
    echo "Please login with root access."
    exit 1
else
    echo "Root user LoggedIn"
fi

validate(){
 if [ $? -eq 0 ]
    then 
        echo "$2 Installation :: Success"
    else
        echo "$2 installation :: Failure"
        exit 1
    fi
}

#Mysql Installation
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not available....trying to install now"
    dnf install mysql -y
    validate $? "mysql"
else
    echo "Mysql already installed"
fi

#Python Installation
dnf list installed python
if [ $? -ne 0 ]
then
    echo "Python not available...trying to install now"
    dnf install python -y
    validate $? "python"
else
    echo "Python is already installed"
fi

#Nginx Installation
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx not available.. trying to Install now"
    dnf install nginx -y
    validate $? "nginx"
else
    echo "Nginx already installed"
fi