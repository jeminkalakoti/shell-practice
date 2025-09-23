#!/bin/bash

#everything in shell is string by default
NAME="Jemin"
NUMBER1=88
NUMBER2=77

sum=$((NUMBER1 + NUMBER2 + NAME)) #arithmetic operation

echo "Sum is : $sum"
