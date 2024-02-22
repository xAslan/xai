#!/bin/bash

# Private key of the sentry node
node_private_key="ENTER YOUR NODE PRIVATE KEY HERE STARTING WITH 0x"

# Name of the screen session
session_name="xai"

# Start a detached screen session running your program
screen -dmS "$session_name" /home/myname/xai/sentry-node-cli-linux

# Wait a bit for the program to start and get ready for input
sleep 1

# Send commands to your program inside the screen session

# boot-operator command
screen -S "$session_name" -p 0 -X stuff "boot-operator^M"

# Wait for the program to process the command
sleep 1

# Send the private key
screen -S "$session_name" -p 0 -X stuff "$node_private_key^M"

# Wait for the next prompt
sleep 1

# Send 'y' for whitelist
screen -S "$session_name" -p 0 -X stuff "y^M"

# Wait for the owners prompt
sleep 3

# Send spacebar, down arrow, spacebar, and enter for owners
screen -S "$session_name" -p 0 -X stuff " ^[[B ^M"

# The ^M represents the Enter key.
# Adjust the sleep durations based on how quickly your program processes each input.
