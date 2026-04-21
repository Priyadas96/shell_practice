#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/logs/shell-scripts-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR="/home/ec2-user/app_logs"

if [ $USERID -ne 0 ]; then
	echo -e "$R Please login with root user $N"
	exit 1
else
	echo "your LoggedIn as Root"
fi

files_to_delete=$(find $SOURCE_DIR -name "*.log" -mtime +14)
while IFS= read -r file_path; do
	echo "deleting files: $file_path"
	rm -rf $file_path
done <<<$files_to_delete

echo "script executed successfully"
