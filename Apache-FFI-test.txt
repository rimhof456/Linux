#!/bin/bash

# Update and install Apache
sudo apt update && sudo apt install -y apache2 openssl

# Enable and start Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Create a custom HTML file
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>FFI TEST</title>
  <style>
    body {
      background-color: black;
      color: red;
      font-size: 72px;
      font-weight: bold;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
  </style>
</head>
<body>
  FFI TEST
</body>
</html>
EOF

# Allow HTTP and HTTPS through firewall (if UFW is enabled)
if sudo ufw status | grep -q "Status: active"; then
  sudo ufw allow 'Apache Full'
fi

# Generate a self-signed SSL certificate
sudo mkdir -p /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/apache2/ssl/apache.key \
  -out /etc/apache2/ssl/apache.crt \
  -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost"

# Create a basic HTTPS config
cat <<EOF | sudo tee /etc/apache2/sites-available/default-ssl.conf
<IfModule mod_ssl.c>
  <VirtualHost _default_:443>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile    /etc/apache2/ssl/apache.crt
    SSLCertificateKeyFile /etc/apache2/ssl/apache.key

    <FilesMatch "\.(cgi|shtml|phtml|php)$">
      SSLOptions +StdEnvVars
    </FilesMatch>

    <Directory /usr/lib/cgi-bin>
      SSLOptions +StdEnvVars
    </Directory>
  </VirtualHost>
</IfModule>
EOF

# Enable SSL module and site
sudo a2enmod ssl
sudo a2ensite default-ssl.conf

# Reload Apache
sudo systemctl reload apache2
