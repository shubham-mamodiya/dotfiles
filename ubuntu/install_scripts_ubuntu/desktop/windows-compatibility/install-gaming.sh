#!/usr/bin/env bash
set -e

ask() {
  while true; do
    read -rp "$1 [Y/n]: " yn
    case "$yn" in
    [Yy] | "") return 0 ;;
    [Nn]) return 1 ;;
    *) echo "Please answer y or n." ;;
    esac
  done
}

echo "======================================="
echo " Linux Gaming Installer"
echo "======================================="

echo
echo "Installing required packages..."
sudo apt install -y \
  steam \
  gamemode \
  mangohud \
  mesa-vulkan-drivers \
  libvulkan1 \
  vulkan-tools

echo

if ask "Install Lutris?"; then
  sudo apt install -y lutris
fi

if ask "Install OpenRGB?"; then
  sudo apt install -y openrgb
fi

if ask "Install GOverlay (GUI for MangoHud/GameMode)?"; then
  sudo apt install -y goverlay
fi

if ask "Install Gamescope?"; then
  sudo apt install -y gamescope
fi

if ask "Install vkBasalt (post-processing effects)?"; then
  sudo apt install -y vkbasalt
fi

echo
echo "======================================="
echo "Installation Complete!"
echo "======================================="
echo
echo "Installed essentials:"
echo "  ✓ Steam"
echo "  ✓ GameMode"
echo "  ✓ MangoHud"
echo "  ✓ Vulkan support"
echo
echo "Next steps:"
echo "  • Enable Steam Play (Proton)"
echo "  • Use 'gamemoderun %command%' for better performance"
echo "  • Use 'mangohud %command%' for an FPS overlay"
