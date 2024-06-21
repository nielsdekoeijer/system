#!/bin/bash

# Check if a command is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

COMMAND=$@

# Find all private keys in the .ssh directory
SSH_DIR="$HOME/.ssh"
KEYS=$(find "$SSH_DIR" -type f -name "id_*" ! -name "*.pub")

# Iterate through each key
for KEY in $KEYS; do
  # Start a new SSH agent
  eval "$(ssh-agent -s)"
  
  # Add the key to the agent
  ssh-add "$KEY"
  
  # Try the specified command
  eval "$COMMAND"
  
  # Check the exit status of the command
  if [ $? -eq 0 ]; then
    echo "Command succeeded with key: $KEY"
    break
  else
    echo "Command failed with key: $KEY"
  fi
  
  # Kill the SSH agent
  ssh-agent -k
done

