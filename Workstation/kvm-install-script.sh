#!/bin/bash

# KVM Installation Script for Linux Mint
# This script installs KVM, QEMU, and virt-manager (GUI) on Linux Mint

# Exit on any error
set -e

# Display a colorful header
echo -e "\e[1;34m========================================\e[0m"
echo -e "\e[1;32m  KVM & virt-manager Installation Script  \e[0m"
echo -e "\e[1;34m========================================\e[0m"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo -e "\e[1;31mPlease run this script as root or with sudo\e[0m"
  exit 1
fi

# Update package lists
echo -e "\e[1;33m[1/7] Updating package lists...\e[0m"
apt update

# Check CPU virtualization support
echo -e "\e[1;33m[2/7] Checking CPU virtualization support...\e[0m"
if grep -E --color 'vmx|svm' /proc/cpuinfo > /dev/null; then
  echo -e "\e[1;32m✓ CPU virtualization is supported\e[0m"
else
  echo -e "\e[1;31m✗ CPU virtualization not detected!\e[0m"
  echo -e "\e[1;31mPlease enable virtualization in your BIOS/UEFI settings\e[0m"
  exit 1
fi

# Install KVM and related packages
echo -e "\e[1;33m[3/7] Installing KVM and required packages...\e[0m"
apt install -y qemu-kvm libvirt-daemon-system virtinst bridge-utils

# Install virt-manager GUI and additional tools
echo -e "\e[1;33m[4/7] Installing virt-manager GUI and additional tools...\e[0m"
apt install -y virt-manager gir1.2-spiceclientgtk-3.0 dnsmasq virt-viewer

# Add current user to libvirt group
echo -e "\e[1;33m[5/7] Adding current user to libvirt group...\e[0m"
CURRENT_USER=$(logname || echo $SUDO_USER)
if [ -z "$CURRENT_USER" ]; then
  echo -e "\e[1;33mCould not determine current user. Please manually add your user to the libvirt group with:\e[0m"
  echo -e "  sudo usermod -aG libvirt YOUR_USERNAME"
  echo -e "  sudo usermod -aG kvm YOUR_USERNAME"
else
  usermod -aG libvirt $CURRENT_USER
  usermod -aG kvm $CURRENT_USER
  echo -e "\e[1;32mAdded user $CURRENT_USER to libvirt and kvm groups\e[0m"
fi

# Enable and start libvirtd service
echo -e "\e[1;33m[6/7] Enabling and starting libvirt services...\e[0m"
systemctl enable libvirtd
systemctl start libvirtd

# Verify installation
echo -e "\e[1;33m[7/7] Verifying installation...\e[0m"
if systemctl is-active --quiet libvirtd; then
  echo -e "\e[1;32m✓ libvirtd service is running\e[0m"
else
  echo -e "\e[1;31m✗ libvirtd service is not running! Please check for errors\e[0m"
fi

echo -e "\e[1;34m========================================\e[0m"
echo -e "\e[1;32mKVM and virt-manager have been installed!\e[0m"
echo -e "\e[1;33mNOTE: You may need to log out and log back in for group\e[0m"
echo -e "\e[1;33mmembership changes to take effect.\e[0m"
echo -e "\e[1;34m========================================\e[0m"
echo -e "\e[1;37mTo start virt-manager, run:\e[0m"
echo -e "\e[1;37m  $ virt-manager\e[0m"
echo -e "\e[1;34m========================================\e[0m"
