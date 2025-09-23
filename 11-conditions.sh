#!/bin/bash

#even or odd numbers
echo "Enter a number:"
read NUMBER

if [ $((NUMBER % 2)) -eq 0 ]; then
  echo "The number $NUMBER is even"
else
  echo "The number $NUMBER is odd"
fi