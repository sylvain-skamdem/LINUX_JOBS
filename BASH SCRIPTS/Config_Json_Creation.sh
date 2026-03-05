#!/usr/bin/env bash

# Description: This script demonstrates how to check whether config.json file exists.
# Author: Sylvain Simo Kamdem
# Creation Date: 02/15/2026
# Modification Date: 02/20/2026

# Let's define the directory and file path
TARGET_DIR="$HOME/Documents/prometheus"
TARGET_FILE="$TARGET_DIR/config.json"

# Now let's declare JSON content to insert
JSON_CONTENT='{
  "monitoring": {
    "enabled": true
  },
  "environment": "production",
  "features": {
    "newDashboard": true,
    "darkThemeDefault": false,
    "betaUsersOnly": ["Thomas", "Mandela"],
    "rateLimit": 120,
    "Prometheus_port": 9096
  },
  "rolloutPercentage": 75
}'

# Step 1: Let's ensure the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory does not exist. Creating: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"
fi

# Step 2: Check if the file exists
if [ ! -f "$TARGET_FILE" ]; then
  echo "File does not exist. Creating config.json..."
  echo "$JSON_CONTENT" > "$TARGET_FILE"
  echo "config.json created successfully."
  exit 0
fi

# Step 3: File exists — check if it's empty
if [ ! -s "$TARGET_FILE" ]; then
  echo "File exists but is empty. Adding JSON content..."
  echo "$JSON_CONTENT" > "$TARGET_FILE"
  echo "JSON content added successfully."
  exit 0
else
  echo "config.json already exists and is not empty."
  echo "Please, don't bother this file, just check its content using cat or vim."
  echo "Thanks! This is Sims :)"
  exit 1
fi
