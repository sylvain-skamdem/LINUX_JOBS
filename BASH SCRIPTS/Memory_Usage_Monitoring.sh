#!/bin/bash

THRESHOLD=80

usage=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "WARNING: Memory usage is ${usage}%"
else
    echo "Memory usage is normal: ${usage}%"
fi
