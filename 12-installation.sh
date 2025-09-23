#!/bin/bash

# TO check if user has a root privilege to install a mysql server
USER_ID=$(id -u)
if [$USER_ID -ne 0 ]; then
    echo "ERROR:: You must have a root privilege to install a mysql"
fi

dnf install mysql -y

USER_ID=$(id -u)
if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is FAILED"
else
    echo "Installing mysql is SUCCESSFUL"
fi
