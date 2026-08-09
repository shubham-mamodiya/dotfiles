#!/usr/bin/env bash
set -e

# Bun
if ! command -v bun >/dev/null; then
    curl -fsSL https://bun.sh/install | bash
fi

# NVM
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

nvm install --lts
