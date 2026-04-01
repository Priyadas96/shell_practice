#!/bin/bash

result=$(id -u)

if [ $result -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

dnf install mysql -y