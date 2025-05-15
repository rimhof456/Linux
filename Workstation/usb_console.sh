#!/bin/bash

# Default baud rate
DEFAULT_BAUD=9600

# Function to find most recently plugged USB serial device
find_usb_serial_device() {
    for device in /dev/ttyUSB* /dev/ttyACM*; do
        [ -e "$device" ] && echo "$device"
    done
}

# Find available device
DEVICE=$(find_usb_serial_device)

# If no device found, exit
if [ -z "$DEVICE" ]; then
    echo "Error: No USB serial device found. Please check your adapter or permissions."
    exit 1
fi

# Show device found
echo "Found device: $DEVICE"

# Ask for baud rate
read -p "Enter baud rate (default ${DEFAULT_BAUD}): " BAUD
BAUD=${BAUD:-$DEFAULT_BAUD}

# Confirm connection
echo "Connecting to $DEVICE with baud rate $BAUD..."
sleep 1

# Connect using screen
exec sudo screen "$DEVICE" "$BAUD"

