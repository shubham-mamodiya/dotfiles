#!/usr/bin/env bash
set -e

sudo apt update

sudo apt install -y \
  tmux \
  stow \
  ffmpeg \
  p7zip-full \
  jq \
  poppler-utils \
  fd-find \
  ripgrep \
  fzf \
  zoxide \
  imagemagick \
  unzip \
  curl \
  nethogs \
  btop \
  git
