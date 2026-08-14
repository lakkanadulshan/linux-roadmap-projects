#!/bin/bash

# =========================================================
# Project Name : Nginx Log Analyser
# Author       : Lakkana Weerarathne
# Description  : CLI tool to analyze Nginx access logs and 
#                display Top 5 IPs, Paths, Status codes, and User agents.
# =========================================================

# Check if log file is provided
if [ $# -eq 0 ]; then
    echo "Error: Log file path is missing."
    echo "Usage: ./nginx-log-analyser.sh <path-to-nginx-access-log>"
    exit 1
fi

LOG_FILE=$1

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

echo "=================================================="
echo "          NGINX LOG ANALYSIS REPORT               "
echo "=================================================="
echo ""

# 1. Top 5 IP addresses with the most requests
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# 2. Top 5 most requested paths
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# 3. Top 5 response status codes
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | grep -E '^[0-9]{3}$' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# 4. Top 5 user agents
echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | grep -v '^$' | sort | uniq -c | sort -nr | head -n 5 | awk '{$1=""; sub(/^ /, ""); print $0}' | while read -r ua; do
    # Count requests for this exact user agent
    count=$(grep -F "\"$ua\"" "$LOG_FILE" | wc -l)
    echo "$ua - $count requests"
done
echo ""
echo "=================================================="