#!/bin/bash

set -e

echo "🔧 Disabling graphical splash screen on boot and shutdown..."

# Step 1: Backup original GRUB config
GRUB_FILE="/etc/default/grub"
BACKUP_FILE="/etc/default/grub.bak"

echo "📁 Backing up GRUB config to $BACKUP_FILE..."
sudo cp "$GRUB_FILE" "$BACKUP_FILE"

# Step 2: Remove 'quiet splash' from GRUB_CMDLINE_LINUX_DEFAULT
echo "✏ Updating GRUB configuration..."
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*"/GRUB_CMDLINE_LINUX_DEFAULT=""/' "$GRUB_FILE"

# Step 3: Update GRUB
echo "🔄 Updating GRUB..."
sudo update-grub

# Step 4: Remove or disable Plymouth splash screen
echo "❌ Removing Mint splash theme..."
sudo apt remove --purge -y plymouth-theme-mint || echo "Theme not found, skipping..."

echo "🛑 Masking Plymouth systemd startup..."
sudo systemctl mask plymouth-start.service || echo "No plymouth-start.service found"

echo "✅ Done! Text-only boot will show after reboot."
read -p "🔁 Do you want to reboot now? [y/N]: " REBOOT
if [[ "$REBOOT" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo "⚠ Please reboot manually to apply changes."
fi
