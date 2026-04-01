#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Please login with Root access."
    exit 1
else
    echo "you are a Root User"
fi