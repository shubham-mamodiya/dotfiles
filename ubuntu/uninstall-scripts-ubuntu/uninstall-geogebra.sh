#!/bin/bash

set -e

echo "Removing GeoGebra Classic..."
sudo apt remove --purge -y geogebra-classic

echo "Removing unused dependencies..."
sudo apt autoremove -y

echo "Removing GeoGebra repository..."
sudo rm -f /etc/apt/sources.list.d/geogebra*.list

# Remove repository if it was added directly to sources.list
sudo sed -i '/geogebra\.net\/linux/d' /etc/apt/sources.list

echo "Removing GeoGebra GPG key..."
# Remove old apt-key if present
sudo apt-key del 7B3B09DC 2>/dev/null || true

# Also remove any keyrings that may exist
sudo rm -f /etc/apt/trusted.gpg.d/*geogebra*
sudo rm -f /usr/share/keyrings/*geogebra*

echo "Updating package lists..."
sudo apt update

echo "GeoGebra has been uninstalled successfully."
