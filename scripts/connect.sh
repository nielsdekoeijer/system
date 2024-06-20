#!/bin/bash
set -e
STATION=wlp0s20f3
echo "'iwctl station $STATION scan'..."
iwctl station $STATION scan
echo "'iwctl station $STATION scan' OK"
echo "'iwctl station $STATION get-results'..."
iwctl station $STATION get-networks
echo "'iwctl station $STATION get-results' OK"
echo "'read'..."
read -p "Network: " NETWORK
echo "'read' OK"
echo "'iwctl station wlan connect $NETWORK'..."
# iwctl station $STATION connect "$NETWORK"
echo "'iwctl station wlan connect $NETWORK' OK"
echo "'sudo /sbin/dhclient'..."
sudo /sbin/dhclient
echo "'sudo /sbin/dhclient' OK"
echo "network login..."
firefox captive.apple.com
echo "network login OK"
