#!/bin/bash

USER_ID=$(id -u)
R='\e[0;31m' # Red
G='\e[0;32m' # Green
Y='\e[0;33m' # Yellow
N='\e[0m'    # No Color

SOURCE_DIR=$1 # First argument is source directory
DEST_DIR=$2   # Second argument is destination directory
DAYS=${3:-14} # Third argument is number of days, default is 14 if not provided
LOGS_FOLDER="/var/log/shell-script/"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) # Extract script name without extension
#LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # Define log file path
LOG_FILE="$LOGS_FOLDER/backup.log" # Define log file path

# -e enables the interpretation of backslash escapes

mkdir -p $LOGS_FOLDER # Create logs folder if not exists
echo "Script started and executed at : $(date)" | tee -a $LOG_FILE # Log script start time

if [ $USER_ID -ne 0 ]; then
    echo -e "$R ERROR $N:: You must have a root privilege to install packages" 
    exit 1 # Exit the script if not root
fi

USAGE(){
    echo -e "$R USAGE :: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS> [optional default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE # Call usage function if less than 2 arguments are provided
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R ERROR:: Source $SOURCE_DIR does not exist $N"
    exit 1 # Exit the script if source directory does not exist
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R ERROR:: Destination $DEST_DIR does not exist $N"
    exit 1 # Exit the script if destination directory does not exist
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS) # Find files older than specified days

if [ ! -z "${FILES}" ]; then # Check if FILES is not empty
    echo  "Files found : $FILES"
    TIMESTAMP=$(date +%F-%H-%M) # Get current timestamp
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip" # Define zip file name with timestamp
    echo "zip file name : $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME" # Create zip file with the found files
else
    echo -e "No files to archive ... $Y SKIPPING $N"

fi





