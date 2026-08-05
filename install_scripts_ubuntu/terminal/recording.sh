#!/usr/bin/env bash
set -e

sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt update

sudo apt install -y obs-studio

flatpak install -y flathub com.dec05eba.gpu_screen_recorder
