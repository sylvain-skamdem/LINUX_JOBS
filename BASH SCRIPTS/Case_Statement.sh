#!/usr/bin/env bash

# Description: This script demonstrates how to write a bash to show the use of the case statement..
# Author: Sylvain Simo Kamdem
# Creation Date: 02/25/2026
# Modification Date: 02/27/2026


# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as administrator (root)."
    exit 1
fi

echo "===== Sims welcomes you. Please choose from menu ====="
echo "1) Display memory usage (in GiB + % over total)"
echo "2) Display disk usage (in GiB + % over total)"
echo "3) Display list of opened files by processes"
echo "4) Check if yq package is installed (install if missing)"
echo "5) Exit"
echo "==================================="

read -p "Choose an option: " option

case $option in
    1)
        echo "Memory Usage:"
        total=$(free -g | awk '/Mem:/ {print $2}')
        used=$(free -g | awk '/Mem:/ {print $3}')
        percent=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
        echo "Used: ${used}GiB / ${total}GiB (${percent}%)"
        ;;
        
    2)
        echo "Disk Usage (Root /):"
        total=$(df -BG / | awk 'NR==2 {print $2}')
        used=$(df -BG / | awk 'NR==2 {print $3}')
        percent=$(df -h / | awk 'NR==2 {print $5}')
        echo "Used: ${used} / ${total} (${percent})"
        ;;
        
    3)
        echo "Opened files by processes:"
        lsof
        ;;
        
    4)
        echo "Checking if yq is installed..."
        
        if command -v yq &> /dev/null; then
            echo "yq is already installed."
        else
            echo "yq is not installed. Installing now..."
            
            if command -v apt &> /dev/null; then
                apt update && apt install -y yq
            elif command -v dnf &> /dev/null; then
                dnf install -y yq
            elif command -v yum &> /dev/null; then
                yum install -y yq
            else
                echo "Unsupported package manager."
            fi
        fi
        ;;
        
    5)
        echo "Exiting script..."
        exit 0
        ;;
        
    *)
        echo "Invalid option, please choose from 1-5."
        ;;
esac
