#!/bin/bash

START_TIME=$(date +%s) # Capture the start time

sleep 5 # Simulate a process that takes time (e.g., sleep for 5 seconds)

END_TIME=$(date +%s) # Capture the end time after the process completes 

TOTAL_TIME=$((END_TIME - START_TIME)) # Calculate the total time taken in seconds 

echo "Script executed in : $TOTAL_TIME seconds" 