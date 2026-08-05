#!/usr/bin/env bash
set -e

echo "== Installing Wine =="

sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources
sudo apt update
sudo apt install --install-recommends winehq-stableecho

echo "Initializing Wine..."
wineboot

echo
echo "Done!"
echo
echo "Useful commands:"
echo "  winecfg"
echo "  wine notepad"
echo "  winetricks"
