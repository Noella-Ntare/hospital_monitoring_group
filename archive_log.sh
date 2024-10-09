#!/bin/bash

# Define the log file name
log_file="heart_rate_log.txt"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
  echo "Log file $log_file does not exist!"
  exit 1
fi

# Get the current timestamp in the format YYYYMMDD_HHMMSS
timestamp=$(date '+%Y%m%d_%H%M%S')

# Define the new archived log file name
archived_log_file="${log_file}_${timestamp}"

# Rename (archive) the log file
mv "$log_file" "$archived_log_file"

# Notify the user
echo "Log file has been archived as $archived_log_file"

