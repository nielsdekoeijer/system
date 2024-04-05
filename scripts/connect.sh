#!/bin/bash
set -e
echo "'iwctl station wlan0 scan'..."
iwctl station wlan0 scan
echo "'iwctl station wlan0 scan' OK"
echo "'iwctl station wlan0 get-results'..."
iwctl station wlan0 get-networks
echo "'iwctl station wlan0 get-results' OK"
echo "'read'..."
read -p "Network: " NETWORK
echo "'read' OK"
echo "'iwctl station wlan connect $NETWORK'..."
iwctl station wlan0 connect "$NETWORK"
echo "'iwctl station wlan connect $NETWORK' OK"
echo "'sudo /sbin/dhclient'..."
sudo /sbin/dhclient
echo "'sudo /sbin/dhclient' OK"
echo "network login..."
chromium captive.apple.com
echo "network login OK"
