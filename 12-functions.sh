#!/bin/bash
userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Error :: Please login with root access"
else
    echo "Root user loggedIn"
fi