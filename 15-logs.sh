#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

Validate(){
    if [ $? -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R Failure $N" | tee -a $LOG_FILE
        exit 1
    fi
}

#Check where Logged In user is ROOT or not
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please login with Root access$N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G User LoggedIN as ROOT $N" | tee -a $LOG_FILE
fi

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$Y Not Installed mySQL.. going to Install now $N" | tee -a $LOG_FILE
    dnf install mysql -y
    Validate $? "MySQL"
else
    echo -e "Nothing to do ... $Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$Y Not installed Python...going to install now $N" | tee -a $LOG_FILE
    dnf install python3 -y
    Validate $? "python3"
else
    echo -e "Nothing to do ...$Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$Y Not installed nginx...going to install now $N" | tee -a $LOG_FILE
    dnf install nginx -y
    Validate $? "nginx"
else
    echo -e "Nothing to do ...$Y already installed $N" | tee -a $LOG_FILE
fi
