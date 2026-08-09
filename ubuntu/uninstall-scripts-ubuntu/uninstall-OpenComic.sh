#!/usr/bin/env bash
set -euo pipefail

if ! dpkg -s opencomic >/dev/null 2>&1; then
  echo "OpenComic is not installed."
  exit 0
fi

echo "Removing OpenComic..."

sudo apt remove -y opencomic

echo
read -rp "Remove your personal OpenComic settings and cache? [y/N] " REPLY

case "$REPLY" in
[yY] | [yY][eE][sS])
  rm -rf \
    "$HOME/.config/OpenComic" \
    "$HOME/.cache/OpenComic" \
    "$HOME/.local/share/OpenComic"

  echo "User settings and cache removed."
  ;;
*)
  echo "User settings were kept."
  ;;
esac

echo
echo "✓ OpenComic has been uninstalled."
