#!/usr/bin/env bash
set -e

sudo apt install -y tlp tlp-rdw

sudo systemctl enable --now tlp

# NVIDIA laptops only
# Uncomment if applicable
# sudo prime-select on-demand
