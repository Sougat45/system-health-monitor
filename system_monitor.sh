#!/bin/bash
# system_monitor.sh

while true; do
    clear
    echo "====================================="
    echo "   💻 SYSTEM HEALTH MONITOR"
    echo "====================================="
    echo ""
    echo "📅 Date    : $(date)"
    echo "👤 User    : $(whoami)"
    echo "🖥️  Hostname: $(hostname)"
    echo ""
    echo "--- CPU Usage ---"
    top -bn1 | grep "Cpu(s)" | awk '{print "   Usage: " $2 "%"}'
    echo ""
    echo "--- RAM Usage ---"
    free -h | awk '/Mem/{printf "   Total: %s | Used: %s | Free: %s\n", $2, $3, $4}'
    echo ""
    echo "--- Disk Usage ---"
    df -h / | awk 'NR==2{printf "   Total: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5}'
    echo ""
    echo "--- Top 5 Processes (by CPU) ---"
    ps aux --sort=-%cpu | head -6 | awk 'NR>1{printf "   %-10s CPU: %s%%  RAM: %s%%\n", $11, $3, $4}'
    echo ""
    echo "--- Network Info ---"
    echo "   IP: $(hostname -I | awk '{print $1}')"
    echo ""
    echo "====================================="
    echo "   Refreshing every 5 seconds..."
    sleep 5
done