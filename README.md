# Hybrid IDS Wazuh Manager Setup

## Overview
This repository provides an automated setup for the Wazuh Manager used in the Hybrid IDS project.
It installs Wazuh Manager and applies predefined local rules to ensure consistent detection behaviour.

## System Role
- Deployed on Wazuh Manager EC2 instance
- Receives events from Wazuh agents
- Applies custom host based detection rules

## Supported Platform
- Ubuntu 20.04 / 22.04 (64 bit)

## Installation
git clone https://github.com/SahiK19/hybrid-ids-wazuh-manager.git  
cd hybrid-ids-wazuh-manager  
sudo ./install_wazuh_manager.sh  

## Configuration
- Custom rules are stored in:
  /var/ossec/etc/rules/local_rules.xml

## Validation
After installation, verify:
systemctl status wazuh-manager
