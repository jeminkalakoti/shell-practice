#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # In projects we use 75%

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -gt $DISK_THRESHOLD ]; then
        echo "High disk usage on $PARTITION: $USAGE"
    fi
done <<< $DISK_USAGE 