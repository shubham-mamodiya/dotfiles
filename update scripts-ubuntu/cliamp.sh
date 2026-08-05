#!/usr/bin/env bash
set -e

echo "Installing cliamp..."

curl -fsSL https://raw.githubusercontent.com/bjarneo/cliamp/HEAD/install.sh | sh

echo "Creating desktop entry..."

APP_DIR="$HOME/.local/share/applications"
mkdir -p "$APP_DIR"

cat > "$APP_DIR/cliamp.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=cliamp
GenericName=Music Player
Comment=A retro terminal music player inspired by Winamp 2.x
Exec=ghostty -e cliamp "$HOME/Music"
Icon=cliamp
Terminal=false
Type=Application
Categories=Audio;Music;Player;AudioVideo;
Keywords=music;audio;player;terminal;tui;winamp;radio;podcast;
StartupNotify=false
EOF

chmod +x "$APP_DIR/cliamp.desktop"

# Refresh desktop database if available
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$APP_DIR"
fi

echo "✅ cliamp installed successfully."
echo "✅ Desktop entry created at:"
echo "   $APP_DIR/cliamp.desktop"
