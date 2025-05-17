#!/bin/bash

echo "Updating package list..."
sudo apt update

echo "Installing Wireshark..."
sudo apt install -y wireshark

echo "Configuring permissions..."
# This allows non-root users to capture packets
sudo dpkg-reconfigure wireshark-common

# Add current user to wireshark group
sudo usermod -aG wireshark "$USER"

echo "Wireshark installation complete."
echo "You may need to log out and log back in for group changes to take effect."
