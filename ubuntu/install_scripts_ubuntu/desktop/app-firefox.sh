#!/usr/bin/env bash
set -euo pipefail

echo "==> Removing Firefox Snap (if installed)..."
if snap list firefox >/dev/null 2>&1; then
  sudo snap remove --purge firefox
else
  echo "Firefox Snap is not installed."
fi

echo "==> Creating keyring directory..."
sudo install -d -m 0755 /etc/apt/keyrings

echo "==> Downloading Mozilla signing key..."
wget -qO- https://packages.mozilla.org/apt/repo-signing-key.gpg |
  sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null

echo "==> Adding Mozilla repository..."
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" |
  sudo tee /etc/apt/sources.list.d/mozilla.list >/dev/null

echo "==> Setting repository priority..."
cat <<EOF | sudo tee /etc/apt/preferences.d/mozilla >/dev/null
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
EOF

# echo "==> Updating package lists..."
# sudo apt update

echo "==> Installing Firefox..."
sudo apt install firefox

echo
echo "==> Installation complete!"
echo

echo "Firefox version:"
firefox --version

echo
echo "APT source:"
apt policy firefox

echo
echo "Binary location:"
which firefox

echo
echo "Done!"
