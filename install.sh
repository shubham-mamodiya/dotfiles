#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ./install/terminal.sh

  # Install desktop tools and tweaks
  source ./install/desktop.sh

