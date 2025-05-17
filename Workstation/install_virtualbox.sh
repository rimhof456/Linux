#!/bin/bash

set -e

# Step 1: Update system
sudo apt update
sudo apt upgrade -y

# Step 2: Install dependencies
sudo apt install -y wget apt-transport-https gnupg

# Step 3: Import VirtualBox GPG key
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg

# Step 4: Add VirtualBox repository (for Linux Mint 22, based on Ubuntu 24.04 "noble")
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] http://download.virtualbox.org/virtualbox/debian noble contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Step 5: Update package list again
sudo apt update

# Step 6: Install VirtualBox (latest 7.1.x)
sudo apt install -y virtualbox-7.1

# Step 7: Find installed VirtualBox version
VBOX_VER=$(vboxmanage -v | cut -dr -f1)

# Step 8: Download and install Extension Pack (matching version)
cd /tmp
wget "https://download.virtualbox.org/virtualbox/${VBOX_VER}/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VER}.vbox-extpack"
sudo vboxmanage extpack install --replace "Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VER}.vbox-extpack"

# Step 9: Add current user to vboxusers group
sudo usermod -aG vboxusers $USER

echo
echo "VirtualBox $VBOX_VER and Extension Pack installed successfully!"
echo "Please reboot your system or log out and back in to apply group membership changes."
echo "You can start VirtualBox from your application menu (look for 'Oracle VM VirtualBox')."
