#!/bin/bash

# TO check if user has a root privilege to install a mysql server
USER_ID=$(id -u)
R='\e[0;31m' # Red
G='\e[0;32m' # Green
Y='\e[0;33m' # Yellow
N='\e[0m'    # No Color

# -e enables the interpretation of backslash escapes

if [ $USER_ID -ne 0 ]; then
    echo -e "$R ERROR $N:: You must have a root privilege to install packages" 
    exit 1 # Exit the script if not root
fi

VALIDATE(){ # Functions receive arguments like normal scripts
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILED $N"
        exit 1 # Exit the script if installation failed with red color
    else
        echo -e "Installing $2 ... $G SUCCESSFUL $N" # Print success message in green color
    fi 

}

dnf list installed mysql # Check if mysql is already installed
if [ $? -ne 0 ]; then # If not installed, then install it
    dnf install mysql -y # Install mysql package
    VALIDATE $? "mysql" # Validate installation
else 
    echo -e "mysql is already installed ... $Y SKIPPING $N" # Print message if already installed in yellow color
fi  

dnf list installed nginx # Check if mysql is already installed
if [ $? -ne 0 ]; then # If not installed, then install it
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx is already installed ... $Y SKIPPING $N"
fi

dnf list installed python3 # Check if mysql is already installed
if [ $? -ne 0 ]; then # If not installed, then install it
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python3 is already installed ... $Y SKIPPING $N"
fi
