#!/bin/bash

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
echo "Script started and executed at : $(date)" | tee -a $LOG_FILE # Log script start time

SOURCE_DIR=/home/ec2-user/app-logs # Define the source directory

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R ERROR $N:: Source directory $SOURCE_DIR does not exist"
    exit 1 # Exit the script if source directory does not exist
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +9) # Find log files older than 14 days

while IFS= read -r filepath # Read each file from the list
do 
    echo -e "$Y Deleting file $N: $filepath" # Log the file being deleted
    rm -rf $filepath # Delete the file
    echo -e "$R Deleted file $N: $filepath" # Log the deletion
done <<< "$FILES_TO_DELETE" # Read each file from the list