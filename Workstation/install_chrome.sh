#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package list..."
sudo apt update

echo "Installing required dependencies (if not already installed)..."
sudo apt install -y wget gnupg2

echo "Downloading Google's signing key..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-linux-signing-key.gpg

echo "Adding Google Chrome repository..."
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/google-linux-signing-key.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

echo "Updating package list with new repository..."
sudo apt update

echo "Installing Google Chrome Stable..."
sudo apt install -y google-chrome-stable

echo "Google Chrome installation completed successfully!"
