#!/bin/bash

#everything in shell is string by default
NAME="Jemin"
NUMBER1=88
NUMBER2=77

sum=$((NUMBER1 + NUMBER2 + NAME)) #arithmetic operation

echo "Sum is : ${sum}"

#Here the index is 0 and size is 4
LEADERS=("Jemin, Lakshmi, Ande, Kalakoti")

echo "First leader is : ${LEADERS[0]}"
echo "Number of leaders are : ${#LEADERS[@]}"
echo "All leaders are : ${LEADERS[@]}"
