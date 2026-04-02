#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0]
    echo "Please login with root access"
else
    echo "Root user loggedIn"
fi