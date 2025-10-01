#!/bin/bash

count=5

echo "Start countdown ..."

while [ $count -gt 0 ]; # greater than 0
do
    echo "Time left: $count" 
    sleep 1 # sleep for 1 second
    count=$(((count - 1))) # decrement the count by 1
    
done 

echo "Countdown completed!"
echo "Launch the missile!"
