#!/bin/bash

# Update system
apt update && apt upgrade -y

# Set server hostname and hosts entry
hostnamectl set-hostname mail.ffi-test.com
echo "10.0.0.7 mail.ffi-test.com" >> /etc/hosts

# Install Postfix and Dovecot
DEBIAN_FRONTEND=noninteractive apt install -y postfix dovecot-core dovecot-imapd dovecot-pop3d mailutils

# Set up mail directory and virtual users
groupadd -g 5000 vmail || true
useradd -g vmail -u 5000 vmail -d /var/mail/vhosts -m || true

mkdir -p /var/mail/vhosts/ffi-test.com/{bob,jill,yeyag1984}
chown -R vmail:vmail /var/mail/vhosts

# Set passwords (hashed using doveadm)
BOB_PASS=$(doveadm pw -s SHA512-CRYPT -p "bob123")
JILL_PASS=$(doveadm pw -s SHA512-CRYPT -p "jill123")
YEYA_PASS=$(doveadm pw -s SHA512-CRYPT -p "yeya1984")

cat > /etc/dovecot/users <<EOF
bob@ffi-test.com:$BOB_PASS:5000:5000::/var/mail/vhosts/ffi-test.com/bob
jill@ffi-test.com:$JILL_PASS:5000:5000::/var/mail/vhosts/ffi-test.com/jill
yeyag1984@ffi-test.com:$YEYA_PASS:5000:5000::/var/mail/vhosts/ffi-test.com/yeyag1984
EOF

# Configure Postfix
postconf -e "myhostname = mail.ffi-test.com"
postconf -e "mydomain = ffi-test.com"
postconf -e "myorigin = \$mydomain"
postconf -e "inet_interfaces = all"
postconf -e "inet_protocols = ipv4"
postconf -e "mydestination = localhost"
postconf -e "virtual_mailbox_domains = ffi-test.com"
postconf -e "virtual_mailbox_base = /var/mail/vhosts"
postconf -e "virtual_mailbox_maps = hash:/etc/postfix/vmailbox"
postconf -e "virtual_minimum_uid = 5000"
postconf -e "virtual_uid_maps = static:5000"
postconf -e "virtual_gid_maps = static:5000"
postconf -e "virtual_alias_maps = hash:/etc/postfix/virtual"
postconf -e "smtpd_tls_security_level = may"
postconf -e "smtpd_sasl_type = dovecot"
postconf -e "smtpd_sasl_path = private/auth"
postconf -e "smtpd_sasl_auth_enable = yes"
postconf -e "smtpd_recipient_restrictions = permit_sasl_authenticated, permit_mynetworks, reject_unauth_destination"

# Configure virtual mailboxes
cat > /etc/postfix/vmailbox <<EOF
bob@ffi-test.com ffi-test.com/bob/
jill@ffi-test.com ffi-test.com/jill/
yeyag1984@ffi-test.com ffi-test.com/yeyag1984/
EOF

postmap /etc/postfix/vmailbox

# Create empty virtual file for aliases
touch /etc/postfix/virtual
postmap /etc/postfix/virtual

# Restart Postfix
systemctl restart postfix

# Configure Dovecot
cat > /etc/dovecot/dovecot.conf <<EOF
!include_try /usr/share/dovecot/protocols.d/*.protocol
dict {
}
!include conf.d/*.conf
!include_try local.conf
EOF

cat > /etc/dovecot/conf.d/10-mail.conf <<EOF
mail_location = maildir:/var/mail/vhosts/%d/%n
namespace inbox {
  inbox = yes
}
EOF

cat > /etc/dovecot/conf.d/10-auth.conf <<EOF
disable_plaintext_auth = no
auth_mechanisms = plain login
!include auth-passwdfile.conf.ext
EOF

cat > /etc/dovecot/conf.d/auth-passwdfile.conf.ext <<EOF
passdb {
  driver = passwd-file
  args = scheme=SHA512-CRYPT /etc/dovecot/users
}
userdb {
  driver = passwd-file
  args = /etc/dovecot/users
}
EOF

cat > /etc/dovecot/conf.d/10-master.conf <<EOF
service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
    user = postfix
    group = postfix
  }
}
EOF

# Set permissions
chown -R vmail:dovecot /etc/dovecot/users
chmod 640 /etc/dovecot/users

# Restart Dovecot
systemctl restart dovecot

echo "✅ Mail server setup complete."
echo "Users:"
echo " - bob@ffi-test.com (password: bob123)"
echo " - jill@ffi-test.com (password: jill123)"
echo " - yeyag1984@ffi-test.com (password: yeya1984)"
