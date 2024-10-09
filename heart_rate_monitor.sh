#!/bin/bash

# Prompt the user for the device name
echo -n "Enter device name (e.g., Monitor_A, Monitor_B): "
read device_name

# Log file where the data will be stored
log_file="heart_rate_log.txt"

# Function to generate a random heart rate (between 40 and 100 bpm)
generate_heart_rate() {
  echo $((40 + RANDOM % 61))
}

# Write log data with timestamp, device name, and random heart rate every second
while true
do
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  heart_rate=$(generate_heart_rate)
  echo "$timestamp $device_name $heart_rate" >> $log_file
  sleep 1
done

