#!/bin/bash

set -e

NETPLAN_FILE="/etc/netplan/50-cloud-init.yaml"

echo "[+] Backing up $NETPLAN_FILE..."
sudo cp "$NETPLAN_FILE" "$NETPLAN_FILE.bak"

echo "[+] Modifying Netplan configuration to add DNS servers..."

# Use yq if available; otherwise fallback to sed/in-place edit
if command -v yq &>/dev/null; then
    # Structured YAML edit (requires yq installed)
    sudo yq eval '.network.ethernets[].nameservers.addresses = ["8.8.8.8", "1.1.1.1"]' -i "$NETPLAN_FILE"
else
    # Sed fallback: basic insert assuming default layout
    sudo sed -i '/dhcp4: yes/a \      nameservers:\n        addresses:\n          - 8.8.8.8\n          - 1.1.1.1' "$NETPLAN_FILE"
fi

echo "[+] Applying Netplan configuration..."
sudo netplan apply

echo "[✓] DNS set to 8.8.8.8 and 1.1.1.1 via Netplan."
