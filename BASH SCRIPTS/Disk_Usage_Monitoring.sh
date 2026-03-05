#!/bin/bash

THRESHOLD=85
PARTITION="/"

usage=$(df -h $PARTITION | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage is at ${usage}% (Threshold: ${THRESHOLD}%)"
else
    echo "Disk usage is normal: ${usage}%"
fi
