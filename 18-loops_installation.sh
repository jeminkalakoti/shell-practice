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

# $@ is used to pass all arguments to a function
for package in "$@"
do
    echo "Processing package: $package" # Print the current package being processed
done