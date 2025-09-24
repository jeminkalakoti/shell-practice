#!/bin/bash

# TO check if user has a root privilege to install a mysql server
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: You must have a root privilege to install mysql"
    exit 1 # Exit the script if not root
fi

VALIDATE(){ # Functions reciece arguments like normal scripts
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is FAILED"
        exit 1 # Exit the script if installation failed
    else
        echo "Installing $2 is SUCCESSFUL"
    fi 

}

dnf install mysql -y
VALIDATE $? "mysql

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"

