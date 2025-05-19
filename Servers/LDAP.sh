#!/bin/bash

set -e

echo "[+] Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing OpenLDAP server and utilities..."
sudo apt install -y slapd ldap-utils

echo "[+] Reconfiguring slapd (you'll be prompted to set the admin password)..."
sudo dpkg-reconfigure slapd

echo "[+] Installing phpLDAPadmin and Apache..."
sudo apt install -y phpldapadmin apache2 openssl

echo "[+] Enabling and starting Apache..."
sudo systemctl enable apache2
sudo systemctl start apache2

echo "[+] Configuring phpLDAPadmin for remote web access..."
sudo sed -i "s/127.0.0.1/0.0.0.0/" /etc/phpldapadmin/config.php
sudo sed -i "s/\$servers->setValue('login','attr','uid');/\$servers->setValue('login','attr','cn');/" /etc/phpldapadmin/config.php
sudo sed -i "s/Require local/Require all granted/" /etc/apache2/conf-available/phpldapadmin.conf

echo "[+] Creating self-signed SSL certificate..."
sudo mkdir -p /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/apache2/ssl/selfsigned.key \
  -out /etc/apache2/ssl/selfsigned.crt \
  -subj "/C=US/ST=State/L=City/O=Organization/OU=IT/CN=ldap.local"

echo "[+] Configuring Apache to use HTTPS with self-signed certificate..."
SSL_CONF="/etc/apache2/sites-available/phpldapadmin-ssl.conf"

sudo bash -c "cat > $SSL_CONF" <<EOF
<VirtualHost *:443>
    ServerAdmin admin@ldap.local
    DocumentRoot /usr/share/phpldapadmin
    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/selfsigned.crt
    SSLCertificateKeyFile /etc/apache2/ssl/selfsigned.key
    <Directory /usr/share/phpldapadmin/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF

echo "[+] Enabling SSL module and site..."
sudo a2enmod ssl
sudo a2ensite phpldapadmin-ssl.conf
sudo systemctl reload apache2

echo "[+] Installation complete!"
echo "Access phpLDAPadmin at: https://<your-server-ip>/"
echo "⚠️ You will see a browser warning due to the self-signed certificate."
