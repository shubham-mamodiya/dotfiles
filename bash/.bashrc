# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

alias share_files="python3 ~/.scripts/share.py -p 8000"

export PATH="/home/nuts/.cache/.bun/bin:$PATH"

# FVM
export PATH="$PATH":"$HOME/.pub-cache/bin"

alias flutter="fvm flutter"

# for flutter to use chromium
export CHROME_EXECUTABLE=/usr/bin/chromium

# android studio and emulators
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# android studio and emulators end
