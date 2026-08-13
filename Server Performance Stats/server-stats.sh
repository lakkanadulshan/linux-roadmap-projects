#!/bin/bash

# ===================================================
# Script Name: server-stats.sh
# Description: Analyzes basic server performance stats
# ===================================================

echo "=================================================="
echo "          SERVER PERFORMANCE STATS                "
echo "=================================================="
echo ""

# 1. OS Version & System Information (Stretch Goal)
echo "--- System Information ---"
echo "OS Version:     $(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '=' -f2 | tr -d '"')"
echo "Kernel Version: $(uname -r)"
echo "Uptime:         $(uptime -p)"
echo "Load Average:   $(uptime | awk -F'load average:' '{ print $2 }')"
echo ""

# 2. Total CPU Usage
echo "--- CPU Usage ---"
# Using top command to calculate idle percentage and subtracting from 100
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d',' -f1)
CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}")
echo "Total CPU Usage: ${CPU_USAGE}%"
echo ""

# 3. Total Memory Usage
echo "--- Memory Usage ---"
free -m | awk 'NR==2{
    total=$2; 
    used=$3; 
    free=$4; 
    printf "Total: %d MB | Used: %d MB (%.2f%%) | Free: %d MB (%.2f%%)\n", total, used, (used/total)*100, free, (free/total)*100
}'
echo ""

# 4. Total Disk Usage
echo "--- Disk Usage ---"
df -h / | awk 'NR==2{
    printf "Total: %s | Used: %s (%s) | Free: %s\n", $2, $3, $5, $4
}'
echo ""

# 5. Top 5 Processes by CPU Usage
echo "--- Top 5 Processes by CPU Usage ---"
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
echo ""

# 6. Top 5 Processes by Memory Usage
echo "--- Top 5 Processes by Memory Usage ---"
ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
echo ""

echo "=================================================="