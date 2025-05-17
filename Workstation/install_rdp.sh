#!/bin/bash

# Update package list and upgrade existing packages
sudo apt update && sudo apt upgrade -y

# Add the official Remmina PPA for the latest version
sudo add-apt-repository ppa:remmina-ppa-team/remmina-next -y

# Update package list again to include the new PPA
sudo apt update

# Install Remmina and the RDP plugin
sudo apt install -y remmina remmina-plugin-rdp remmina-plugin-secret

# (Optional) Install additional plugins if needed, e.g., VNC, SSH
# sudo apt install -y remmina-plugin-vnc remmina-plugin-ssh

echo "Remmina installation complete! Launch it from your application menu."
