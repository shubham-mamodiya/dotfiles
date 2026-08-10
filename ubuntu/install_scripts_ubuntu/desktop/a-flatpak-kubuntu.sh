#!/bin/bash

sudo apt install -y flatpak

sudo apt install flatpak plasma-discover-backend-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
