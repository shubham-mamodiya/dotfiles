#!/usr/env/bin

  echo -e "Installing Python...\n"
  mise use --global python@latest
  echo -e "\nInstalling uv...\n"
  curl -fsSL https://astral.sh/uv/install.sh | sh
