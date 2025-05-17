#!/bin/bash

# Script to install and configure a TFTP server with upload support on Linux Mint

echo "Updating package lists..."
sudo apt update

echo "Installing TFTP server (tftpd-hpa)..."
sudo apt install -y tftpd-hpa

echo "Creating and configuring TFTP root directory..."
sudo mkdir -p /var/lib/tftpboot
sudo chmod -R 777 /var/lib/tftpboot
sudo chown -R nobody:nogroup /var/lib/tftpboot

echo "Allowing uploads by adjusting TFTP options..."
sudo bash -c 'cat > /etc/default/tftpd-hpa <<EOF
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/var/lib/tftpboot"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="--secure --create"
EOF'

echo "Restarting TFTP server..."
sudo systemctl restart tftpd-hpa
sudo systemctl enable tftpd-hpa

echo "TFTP server with upload support installed successfully!"
echo "To upload: tftp <server_ip> -> put filename"
echo "To download: tftp <server_ip> -> get filename"
