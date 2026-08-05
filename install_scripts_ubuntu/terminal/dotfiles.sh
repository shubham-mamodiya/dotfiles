#!/usr/bin/env bash
set -e

mkdir -p ~/Projects

cd ~/Projects

if [ ! -d dotfiles ]; then
    git clone git@github.com:shubham-mamodiya-dev/dotfiles.git
fi
