#!/bin/bash

# Script Name: readme.sh
# Description: Updates the system's hosts file with custom IP mappings
#
# Usage: ./readme.sh <ip-address>
#
# Example: 
#   ./readme.sh domain.local
#
# The script will:
# 1. Map the provided IP address to 127.0.0.1
#
# 
# Note: Requires administrative/sudo privileges to modify hosts file
#
# Exit codes:
#   0 - Success
#   1 - Error (invalid arguments or unsupported OS)

# Check if an IP address was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <ip-address>"
    exit 1
fi

ip="$1"

# Detect OS
if [ "$(uname -s)" = "Darwin" ] || [ "$(uname -s)" = "Linux" ]; then
    # Unix-like systems (macOS, Linux)
    sudo sh -c "echo '127.0.0.1    $ip' >> /etc/hosts"
    sudo sh -c "echo '::1    $ip' >> /etc/hosts"
    echo "Hosts file updated successfully"
elif [ "$OS" = "Windows_NT" ]; then
    # Windows systems
    powershell -Command "Add-Content -Path 'C:\Windows\System32\drivers\etc\hosts' -Value '127.0.0.1    $ip' -Force"
    powershell -Command "Add-Content -Path 'C:\Windows\System32\drivers\etc\hosts' -Value '::1    $ip' -Force"
    echo "Hosts file updated successfully"
else
    echo "Unsupported operating system"
    exit 1
fi
