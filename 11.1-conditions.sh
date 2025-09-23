#!/bin/bash

#To check if a given number is prime or not
echo "Enter a number:"
read NUMBER

if [ $NUMBER -le 1 ]; then
  echo "The number $NUMBER is not prime number"
  exit 0
fi

#To check if the number is prime
for (( i=2; i<=NUMBER/2; i++ )); do
  if [ $((NUMBER % i)) -eq 0 ]; then
    echo "The number $NUMBER is not prime number"
    exit 0
  fi
done    

echo "The number $NUMBER is prime number"