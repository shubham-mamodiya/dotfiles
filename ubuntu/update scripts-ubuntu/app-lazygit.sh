#!/usr/bin/env bash

set -euo pipefail

echo "Installing dependencies..."
sudo apt update
sudo apt install -y curl tar

echo "Fetching latest LazyGit version..."
VERSION=$(curl -fsSL "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | cut -d '"' -f 4)

echo "Latest version: $VERSION"

ARCH=$(dpkg --print-architecture)

case "$ARCH" in
amd64)
  LAZYGIT_ARCH="x86_64"
  ;;
arm64)
  LAZYGIT_ARCH="arm64"
  ;;
armhf)
  LAZYGIT_ARCH="armv6"
  ;;
*)
  echo "Unsupported architecture: $ARCH"
  exit 1
  ;;
esac

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

echo "Downloading LazyGit..."
curl -Lo lazygit.tar.gz \
  "https://github.com/jesseduffield/lazygit/releases/download/${VERSION}/lazygit_${VERSION#v}_Linux_${LAZYGIT_ARCH}.tar.gz"

echo "Extracting..."
tar xf lazygit.tar.gz lazygit

echo "Installing..."
sudo install lazygit /usr/local/bin

cd /
rm -rf "$TMP_DIR"

echo "Installation complete!"
echo
lazygit --version
