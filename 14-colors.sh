#!/bin/bash

R='\e[0;31m' # Red
G='\e[0;32m' # Green
Y='\e[0;33m' # Yellow
N='\e[0m'    # No Color

echo -e "$R Hello World $N" # Print Hello World in red color and reset color
echo "This is red color" # Print normal color text