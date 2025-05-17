#!/bin/bash

# Bash script to install and configure vsftpd FTP server on Linux Mint

echo "Updating package lists..."
sudo apt update

echo "Installing vsftpd..."
sudo apt install -y vsftpd

echo "Enabling vsftpd service..."
sudo systemctl enable vsftpd

echo "Starting vsftpd service..."
sudo systemctl start vsftpd

echo "Backing up default vsftpd.conf..."
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

echo "Configuring FTP server..."
# Allow local users and enable upload capabilities
sudo bash -c 'cat > /etc/vsftpd.conf <<EOF
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
EOF'

echo "Restarting vsftpd service to apply changes..."
sudo systemctl restart vsftpd

echo "FTP server installation and basic configuration complete!"
echo "You can now connect using your Linux Mint username and password."
