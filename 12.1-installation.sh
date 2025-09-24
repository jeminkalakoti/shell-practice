#!/bin/bash

# TO check if user has a root privilege to install a mysql server
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: You must have a root privilege to install mysql"
    exit 1 # Exit the script if not root
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is FAILED"
    exit 1 # Exit the script if installation failed
else
    echo "Installing mysql is SUCCESSFUL"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nginx is FAILED"
    exit 1 # Exit the script if installation failed
else
    echo "Installing nginx is SUCCESSFUL"
fi

dnf install python3 -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing python3 is FAILED"
    exit 1 # Exit the script if installation failed
else
    echo "Installing python3 is SUCCESSFUL"
fi

