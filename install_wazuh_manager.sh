#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Please run this script as root"
  exit 1
fi

set -e

echo "[INFO] Updating system"
apt update && apt upgrade -y

echo "[INFO] Installing dependencies"
apt install -y curl apt-transport-https lsb-release gnupg

echo "[INFO] Adding Wazuh repository"
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --dearmor | tee /usr/share/keyrings/wazuh.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt stable main" | tee /etc/apt/sources.list.d/wazuh.list

apt update

echo "[INFO] Installing Wazuh Manager"
apt install -y wazuh-manager

systemctl enable wazuh-manager
systemctl start wazuh-manager

echo "[SUCCESS] Wazuh Manager installed"
echo "[INFO] Applying custom local rules"
cp config/local_rules.xml /var/ossec/etc/rules/local_rules.xml
chown wazuh:wazuh /var/ossec/etc/rules/local_rules.xml
chmod 640 /var/ossec/etc/rules/local_rules.xml
