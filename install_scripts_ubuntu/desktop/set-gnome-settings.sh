#!/bin/bash

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# Turn off ambient sensors for setting screen brightness (they rarely work well!)
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

gsettings set org.gnome.desktop.interface text-scaling-factor 1.05


# Caps Lock -> Escape
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
