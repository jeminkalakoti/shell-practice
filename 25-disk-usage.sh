#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # In projects we use 75%
IP_ADDRESS="$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)" # AWS specific
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -gt $DISK_THRESHOLD ]; then
        MESSAGE+="High disk usage on $PARTITION: $USAGE % <br>" # Append to message
    fi
done <<< $DISK_USAGE 

echo -e "Message body: $MESSAGE"

sh mail.sh "lakshmiande20@gmail.com" "High Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team" # Send email

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5
# TO_TEAM=$6