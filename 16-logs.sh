#!bin/bash

USER_ID=$(id -u)
R='\e[0;31m' # Red
G='\e[0;32m' # Green
Y='\e[0;33m' # Yellow
N='\e[0m'    # No Color

LOGS_FOLDER="/var/log/shell-script/"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) # Extract script name without extension
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # Define log file path

# -e enables the interpretation of backslash escapes

mkdir -p $LOGS_FOLDER # Create logs folder if not exists
echo "Script started and executed at : $(date)"

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

dnf list installed mysql &>>$LOG_FILE  # Check if mysql is already installed
if [ $? -ne 0 ]; then # If not installed, then install it
    dnf install mysql -y &>>$LOG_FILE # Install mysql package
    VALIDATE $? "mysql" # Validate installation
else 
    echo -e "mysql is already installed ... $Y SKIPPING $N" # Print message if already installed in yellow color
fi  

dnf list installed nginx &>>$LOG_FILE # Check if mysql is already installed
if [ $? -ne 0 ]; then # If not installed, then install it
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx is already installed ... $Y SKIPPING $N"
fi

dnf list installed python3 &>>$LOG_FILE # Check if mysql is already installed
if [ $? -ne 0 ]; then # If not installed, then install it
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "python3 is already installed ... $Y SKIPPING $N"
fi