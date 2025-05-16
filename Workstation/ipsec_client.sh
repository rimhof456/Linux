#!/bin/bash

set -e

VPN_NAME="MyIPSecVPN"
VPN_SERVER="vpn.example.com"
VPN_USER="your_username"
VPN_PASS="your_password"

echo "[1/4] Installing strongSwan and NetworkManager plugin..."
sudo apt update
sudo apt install -y strongswan strongswan-pki libcharon-extra-plugins network-manager-strongswan

echo "[2/4] Creating VPN configuration directory..."
mkdir -p ~/.certs

echo "[3/4] Configuring VPN using nmcli..."

nmcli connection add type vpn \
  con-name "$VPN_NAME" \
  ifname "*" \
  vpn-type strongswan \
  -- \
  vpn.data "address=$VPN_SERVER, \
    user=$VPN_USER, \
    gateway_type=ikev2, \
    ipcomp=no, \
    remote-id=$VPN_SERVER, \
    encap=no" \
  vpn.secrets "password=$VPN_PASS"

echo "[4/4] VPN '$VPN_NAME' added. You can now connect using the NetworkManager GUI."

echo "✅ Done. Open your network settings to enable the '$VPN_NAME' VPN connection."
