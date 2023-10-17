#!/bin/bash
# This is an example cron job script

# Define a timestamp
timestamp=$(date +"%Y-%m-%d %T")

# Create a log entry with the timestamp
echo "Cron job ran at $timestamp" >> /var/log/mycronjob.log

# You can add more commands or tasks here
# For example, you could perform database backups, data imports, or other periodic tasks.
# Just make sure to log the results to a file for reference.

# For demonstration purposes, let's simulate a longer-running task
sleep 5
echo "Cron job completed at $timestamp" >> /var/log/mycronjob.log