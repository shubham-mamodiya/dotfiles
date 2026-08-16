#!/bin/bash

cd /tmp
LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
sudo apt install -y ./localsend.deb
rm localsend.deb
cd -

echo "Allow Port:53317 on Tcp If you have firewall enabled or else you might 
not be able to connect via localsend."
echo "sudo ufw allow 53317/tcp "
