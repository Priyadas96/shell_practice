#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-scripts-logs"
SCRIPT_FILE=$(echo $0 | cut -d "." f1)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_FILE.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]; then
	echo -e "$R ERROR:: please run with root user $N" | tee -a $LOGS_FILE
	exit 1
else
	echo " You are running as Root" | tee -a $LOGS_FILE
fi

Validate() {
	if [ $1 -eq 0 ]; then
		echo -e "Installing $2 is ...$G Success $N" | tee -a $LOGS_FILE
	else
		echo -e "Installing $2 is ...$R Failure $N" | tee -a $LOGS_FILE
		exit 1
	fi
}

for package in ${PACKAGES[@]}; do
	dnf list installed $package &>>$LOGS_FILE
	if [ $? -ne 0 ]; then
		echo "$package is not installed...going to install" | tee -a $LOGS_FILE
		dnf install $package -y &>>$LOGS_FILE
		Validate $? "$package"
	else
		echo -e "Nothing to do $package..$Y already installed $N" | tee -a $LOGS_FILE
	fi
done
