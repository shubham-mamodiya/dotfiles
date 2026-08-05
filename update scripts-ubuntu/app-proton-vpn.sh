#!/usr/bin/env bash

set -euo pipefail

echo "==> Finding latest Proton VPN repository package..."

PACKAGE_URL=$(curl -fsSL https://repo.protonvpn.com/debian/dists/stable/main/binary-all/ |
  grep -oE 'protonvpn-stable-release_[0-9.]+_all\.deb' |
  sort -V |
  tail -n1)

if [ -z "$PACKAGE_URL" ]; then
  echo "Failed to find the latest Proton VPN repository package."
  exit 1
fi

PACKAGE_URL="https://repo.protonvpn.com/debian/dists/stable/main/binary-all/$PACKAGE_URL"

echo "==> Downloading:"
echo "    $PACKAGE_URL"

cd /tmp
wget -q -O protonvpn-stable-release.deb "$PACKAGE_URL"

echo "==> Installing repository..."
sudo dpkg -i protonvpn-stable-release.deb

echo "==> Updating package lists..."
sudo apt update

echo "==> Installing/Updating Proton VPN..."
sudo apt install -y proton-vpn-gnome-desktop

echo "✅ Proton VPN is installed and up to date."
