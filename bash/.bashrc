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
. "$HOME/.cargo/env"

alias hollow_knight_nvidia='prime-run env SDL_VIDEODRIVER=x11 "$HOME/GOG Games/Hollow Knight/game/Hollow Knight" -force-glcore'
