#!/usr/bin/env bash
set -e

# Ghostty
sudo add-apt-repository -y ppa:mkasberg/ghostty-ubuntu
sudo apt update
sudo apt install -y ghostty

# Starship
sudo apt install -y starship
