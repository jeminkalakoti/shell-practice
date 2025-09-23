#!/bin/bash

echo "All variables in this script: $*"
echo "All variables in this script: $@"
echo "Script name: $0"
echo "Current directory: $PWD"
echo "Who is running this script: $USER"
echo "Home directory of the user running this script: $HOME"
echo "Number of arguments passed to the script: $#"
echo "Process ID of the current script: $$"
echo "Exit status of the last executed command: $?"
echo "Process ID of the last background command: $!"
sleep 5 & # Start a background process (sleep for 5 seconds)