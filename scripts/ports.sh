#!/bin/bash
set -e

# Get the current IP address
IP=$(ip addr show | grep 'inet ' | awk '{print $2}' | grep -v '127.0.0.1' | cut -d/ -f1)

# Extract the subnet
SUBNET=$(echo $IP | awk -F. '{print $1"."$2"."$3".0/24"}')

# Perform nmap scan
echo "Running on $SUBNET..."
nmap -p 22 --open $SUBNET

