#!/bin/bash

# Alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

# Make it easy to maximize like you can fill left/right
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super><Shift>o']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Shift>w']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super><Shift>p']"

# Make it easy to resize undecorated windows
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Super>BackSpace']"

# Full-screen with title/navigation bar
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# Use 6 fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6

# Disable the hotkeys in the Dash to Dock extension (most likely culprit)
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false

# Use alt for pinned apps
gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Super><Alt>1']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Super><Alt>2']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Super><Alt>3']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Super><Alt>4']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Super><Alt>5']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Super><Alt>6']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Super><Alt>7']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Super><Alt>8']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Super><Alt>9']"

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"

# Reserve slots for custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-next/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-prev/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-random/']"

# Set ulauncher to Super+Space
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "@as []"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Ulauncher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'sh -c "pgrep -x ulauncher && { ulauncher-toggle || true; } || setsid -f ulauncher"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'sh -c -- "flameshot gui"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control>Print'

gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" name 'Browser'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" command 'brave-browser-stable'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" binding '<Shift><Super>Return'

gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" name 'Neovim'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" command 'ghostty -e nvim'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" binding '<Shift><Super>n'

gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" name 'yazi'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" command 'ghostty -e yazi'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" binding '<Shift><Super>f'

gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/" name 'ghostty'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/" command 'ghostty'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/" binding '<Super>Return'

gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/" name 'RGB Off'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/" command 'openrgb -p "$HOME/.config/OpenRGB/turn off rgb.orp"'
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/" binding '<Super><Shift>r'

# Next
PATH1=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-next/
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH1 name 'Wallpaper Next'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH1 command "$HOME/.local/bin/wallpaper-next"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH1 binding '<Super>bracketright'

# Previous
PATH2=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-prev/
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH2 name 'Wallpaper Previous'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH2 command "$HOME/.local/bin/wallpaper-prev"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH2 binding '<Super>bracketleft'

# Random
PATH3=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/wallpaper-random/
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH3 name 'Wallpaper Random'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH3 command "$HOME/.local/bin/wallpaper-random"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$PATH3 binding '<Super><Shift>bracketright'

gsettings set org.gnome.desktop.background picture-options 'scaled'
