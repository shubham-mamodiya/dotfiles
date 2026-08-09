#!/usr/bin/env bash

set -e

sudo rm -rf /opt/Telegram
sudo rm -f /usr/local/bin/telegram-desktop
sudo rm -f /usr/share/applications/telegram-desktop.desktop

echo "Telegram Desktop has been removed."
