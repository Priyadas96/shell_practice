#!/bin/bash

userid=$(id -u) #root - 0 and non-root 1-136

if [ $userid -ne 0 ]
then
    echo "Please login with root access."
else
    echo "Root user LoggedIn"
fi



   