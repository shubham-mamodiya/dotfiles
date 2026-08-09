#!/usr/bin/env bash
set -e

echo "== Installing Bottles =="

flatpak install -y flathub com.usebottles.bottles

echo
echo "Launch with:"
echo "flatpak run com.usebottles.bottles"
