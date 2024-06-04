#!/bin/bash

# Create directory hy2 in /root
mkdir -p /root/h-ui

# Check if directory creation was successful
if [ $? -eq 0 ]; then
  echo "Directory hy2 created successfully."
else
  echo "Error creating directory h-ui."
  exit 1
fi

# Download file using wget
wget -O /root/h-ui/hysteria-linux-amd64 https://github.com/apernet/hysteria/releases/download/app%2Fv2.4.4/hysteria-linux-amd64

# Check if download was successful
if [ $? -eq 0 ]; then
  echo "File downloaded successfully."
else
  echo "Error downloading file."
  exit 1
fi

# Set permissions 755 to hysteria-linux-amd64
chmod 755 /root/h-ui/hysteria-linux-amd64

# Check if permissions were set successfully
if [ $? -eq 0 ]; then
  echo "Permissions set successfully."
else
  echo "Error setting permissions."
  exit 1
fi

wget -O /root/h-ui/config.yaml https://raw.githubusercontent.com/KaboomNick/h-ui/main/config.yaml
wget -O /etc/systemd/system/h-ui.service https://raw.githubusercontent.com/KaboomNick/h-ui/main/h-ui.service
openssl ecparam -genkey -name prime256v1 -out /root/h-ui/ca.key
openssl req -new -x509 -days 36500 -key /root/h-ui/ca.key -out /root/h-ui/ca.crt  -subj "/CN=bing.com"

# Reload daemon and enable hy2 service
systemctl daemon-reload
sudo systemctl unmask h-ui.service
systemctl enable h-ui

# Check if enabling h-ui service was successful
if [ $? -eq 0 ]; then
  echo "Service h-ui enabled successfully."
else
  echo "Error enabling service h-ui."
  exit 1
fi

# Ask user if they want to start h-ui service
read -p "Do you want to start the h-ui service? (y/n): " answer

if [ "$answer" == "y" ]; then
  systemctl start h-ui
  if [ $? -eq 0 ]; then
    echo "Service h-ui started successfully."
  else
    echo "Error starting service h-ui."
    exit 1
  fi
else
  echo "Service h-ui was not started."
fi
