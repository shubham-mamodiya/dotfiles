#!/usr/bin/env bash

set -Eeuo pipefail

DOWNLOAD_URL="https://telegram.org/dl/desktop/linux"

TMP_DIR="$(mktemp -d)"
INSTALL_DIR="/opt/Telegram"
BIN_LINK="/usr/local/bin/telegram-desktop"
DESKTOP_FILE="/usr/share/applications/telegram-desktop.desktop"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

require() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Error: '$1' is required."
    exit 1
  }
}

for cmd in curl tar sudo; do
  require "$cmd"
done

echo "Downloading Telegram Desktop..."

curl -L --fail --progress-bar \
  "$DOWNLOAD_URL" \
  -o "$TMP_DIR/telegram.tar.xz"

echo "Extracting..."

tar -xf "$TMP_DIR/telegram.tar.xz" -C "$TMP_DIR"

TELEGRAM_DIR="$(find "$TMP_DIR" -maxdepth 2 -type f -name Telegram -printf '%h\n' | head -n1)"

if [[ -z "$TELEGRAM_DIR" ]]; then
  echo "Failed to locate Telegram executable."
  exit 1
fi

echo "Installing..."

sudo rm -rf "$INSTALL_DIR"

sudo mv "$TELEGRAM_DIR" "$INSTALL_DIR"

sudo chmod +x "$INSTALL_DIR/Telegram"

echo "Creating launcher..."

sudo ln -sfn "$INSTALL_DIR/Telegram" "$BIN_LINK"

ICON=""

for candidate in \
  "$INSTALL_DIR/telegram.png" \
  "$INSTALL_DIR/Telegram.png" \
  "$INSTALL_DIR/icon.png"; do
  if [[ -f "$candidate" ]]; then
    ICON="$candidate"
    break
  fi
done

if [[ -z "$ICON" ]]; then
  ICON=telegram
fi

sudo tee "$DESKTOP_FILE" >/dev/null <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Telegram Desktop
Comment=Official Telegram Desktop
Exec=$BIN_LINK %u
Icon=$ICON
Terminal=false
Categories=Network;InstantMessaging;
StartupWMClass=TelegramDesktop
StartupNotify=true
EOF

if command -v update-desktop-database >/dev/null; then
  sudo update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi

if command -v gtk-update-icon-cache >/dev/null; then
  sudo gtk-update-icon-cache -q /usr/share/icons/hicolor 2>/dev/null || true
fi

echo
echo "Telegram Desktop installed successfully."
echo
echo "Run:"
echo "    telegram-desktop"
