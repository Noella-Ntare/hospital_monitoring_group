#!/bin/bash

# Variables
group_number="<14>"  # Replace with your group number
archive_dir="archived_logs_group14"
remote_host="<15aa38ba824e.079e7915.alu-cod.online>"         # Replace with the sandbox host info
remote_user="<15aa38ba824e>"     # Replace with the sandbox username
remote_dir="/hospital_monitoring_group14_backup/"                 # Directory on the remote server for backup

# Create the archive directory if it doesn't exist
if [ ! -d "$archive_dir" ]; then
  mkdir "$archive_dir"
  echo "Directory $archive_dir created."
else
  echo "Directory $archive_dir already exists."
fi

# Move all archived log files (files with timestamped names) to the archive directory
for file in heart_rate_log.txt_*
do
  if [ -f "$file" ]; then
    mv "$file" "$archive_dir"
    echo "Moved $file to $archive_dir"
  fi
done

# Check if there are files to back up
if [ "$(ls -A $archive_dir)" ]; then
  echo "Starting backup to the remote server..."

  # Use SCP to copy the archived logs to the remote server
  scp "$archive_dir"/* "$remote_user@$remote_host:$remote_dir"

  if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
  else
    echo "Backup failed."
  fi
else
  echo "No files to backup in $archive_dir."
fi

