#!/bin/bash

#To check if a given number is prime or not
echo "Enter a number:"
read NUMBER

if [ $NUMBER -le 1 ]; then
  echo "The number $NUMBER is not prime"
  exit 0
fi