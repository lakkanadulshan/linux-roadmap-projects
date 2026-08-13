#!/bin/bash

# =========================================================
# Project Name : Log Archive Tool
# Author       : Lakkana Weerarathne
# Description  : Archives logs from a directory into a .tar.gz 
#                file with current timestamp and logs the event.
# =========================================================

# Check if the user provided a log directory argument
if [ $# -eq 0 ]; then
    echo "Error: Please provide a log directory."
    echo "Usage: ./log-archive.sh <log-directory>"
    exit 1
fi

LOG_DIR=$1

# Check if the provided directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Set destination folder for archives (Absolute path)
ARCHIVE_DIR="$(pwd)/archive"
mkdir -p "$ARCHIVE_DIR"

# Generate Timestamp (Format: YYYYMMDD_HHMMSS)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define Archive File Name & Log File Name
ARCHIVE_FILENAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_FILENAME}"
LOG_FILE="${ARCHIVE_DIR}/archive_history.log"

echo "Starting log archiving for: $LOG_DIR ..."

# Create tar.gz archive
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" . 2>/dev/null

if [ $? -eq 0 ]; then
    CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[SUCCESS] Logs archived successfully at: $ARCHIVE_PATH"
    
    # Log the archive event with date and time
    echo "[$CURRENT_TIME] Archived '$LOG_DIR' -> '$ARCHIVE_FILENAME'" >> "$LOG_FILE"
else
    echo "[ERROR] Failed to archive logs."
    exit 1
fi