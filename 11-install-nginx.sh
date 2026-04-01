#!/bin/bash
user=$(id -u)

if [ $user -ne 0 ]
then
    echo "please Login with Root access..."
else
    echo "you are root access"
fi