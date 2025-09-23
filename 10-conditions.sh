#!/bin/bash

#To check if a given number is less than 10

NUMBER=$1
if [ $NUMBER -lt 10 ]; then
  echo "The number $NUMBER is less than 10"
else
  echo "The number $NUMBER is greater than 10"
fi

#-gt : greater than
#-lt : less than
#-eq : equal to
#-ne : not equal to
#-ge : greater than or equal to
#-le : less than or equal to