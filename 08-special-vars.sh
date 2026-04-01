#!/bin/bash

echo "All variables passed to the script: $@"
echo "number of variables : @#"
echo "Script name : $0"
echo "Current directory : $PWD"
echo "User running the Script: $USER"
echo "Home Directory of User: $HOME"
echo "PID of the Script : $$"
sleep 10 &
echo "PID of last command in background: $!" 