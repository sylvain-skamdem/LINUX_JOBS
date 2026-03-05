#!/usr/bin/env bash

# Description: This script shows how we can compare values together.
# Author: Staline Ngoma
# Creation Date: 01/30/2026
# Modification Date:

echo -e "Let's play a bit.\nGive me two numbers and I will compare them for you\n"
sleep 2
echo -e "Give me the first number\n"
read NUM1
echo -e "\nGood! Now, give me the second number"
read NUM2

if (( $NUM1 > $NUM2 ))
then
        echo -e "\nAnswer: $NUM1 is greater than $NUM2"
elif (( $NUM1 == $NUM2 ))
then
	echo "Number $NUM1 is equal to $NUM2"
else
        echo -e "\nAnswer: $NUM2 is greater than $NUM1"
fi

echo -e "\nThe sum of the given numbers is $(echo "$NUM1 + $NUM2" | bc)"
