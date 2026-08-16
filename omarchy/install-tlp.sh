#!/usr/bin/env bash
set -euo pipefail

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Checking for power-profiles-daemon..."
if pacman -Q power-profiles-daemon &>/dev/null; then
    sudo systemctl disable --now power-profiles-daemon.service 2>/dev/null || true
    sudo pacman -Rns --noconfirm power-profiles-daemon
else
    echo "    power-profiles-daemon is not installed."
fi

echo "==> Installing TLP..."
sudo pacman -S --needed --noconfirm tlp tlp-pd powertop

echo "==> Enabling TLP..."
sudo systemctl enable --now tlp.service
sudo systemctl enable --now tlp-pd.service

echo "==> Applying TLP..."
sudo tlp start

echo
echo "==> TLP services:"
systemctl is-active tlp.service
systemctl is-active tlp-pd.service

echo
echo "==> Available power profiles:"
tlpctl list

echo
echo "==> TLP status:"
sudo tlp-stat -s

echo
echo "==> Battery information:"
sudo tlp-stat -b

echo
echo "======================================"
echo " TLP setup complete"
echo "======================================"
echo
echo "Useful commands:"
echo "  tlpctl list"
echo "  tlpctl performance"
echo "  tlpctl balanced"
echo "  tlpctl power-saver"
echo "  sudo tlp-stat -b"
echo "  sudo tlp-stat -p"
