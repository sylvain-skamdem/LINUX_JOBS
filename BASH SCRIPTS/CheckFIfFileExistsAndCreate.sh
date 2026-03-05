#!/usr/bin/env bash

# Description: This script demonstrates how to check whether a file exists.
# Author: Staline Ngoma
# Creation Date: 01/30/2026
# Modification Date:

clear
echo "This script will check if a file exist"
sleep 1

FILE_PATH="/opt/created_from_script.rs"

if [[ -e $FILE_PATH ]]
then
        echo -e "\nFile \"$(basename $FILE_PATH)\" exists at $(dirname $FILE_PATH)"
        exit 0
else
        echo -e "\nFile \"$(basename $FILE_PATH)\" does not exists at $(dirname $FILE_PATH)"
        echo -e "\nCreating \"$(basename $FILE_PATH)\" at location $(dirname $FILE_PATH)\n"
        touch $FILE_PATH 2>/dev/null
        if [[ $? -eq 0 ]]
        then
                echo -e "\nNow File \"$(basename $FILE_PATH)\" exists at $(dirname $FILE_PATH)"
        else
                echo "Something when wrong!"
        fi
fi
