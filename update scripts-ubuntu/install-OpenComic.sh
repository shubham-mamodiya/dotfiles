#!/usr/bin/env bash
set -euo pipefail

REPO="ollm/OpenComic"

# Detect architecture
case "$(dpkg --print-architecture)" in
amd64)
  ARCH="amd64"
  ;;
arm64)
  ARCH="arm64"
  ;;
*)
  echo "❌ Unsupported architecture: $(dpkg --print-architecture)"
  exit 1
  ;;
esac

echo "Fetching latest OpenComic release..."

LATEST_VERSION=$(
  curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" |
    grep '"tag_name"' |
    sed -E 's/.*"v([^"]+)".*/\1/'
)

if [[ -z "$LATEST_VERSION" ]]; then
  echo "❌ Failed to determine the latest version."
  exit 1
fi

INSTALLED_VERSION=$(
  dpkg-query -W -f='${Version}' opencomic 2>/dev/null || true
)

echo "Latest version    : $LATEST_VERSION"
echo "Installed version : ${INSTALLED_VERSION:-Not installed}"

if [[ "$INSTALLED_VERSION" == "$LATEST_VERSION" ]]; then
  echo
  echo "✅ OpenComic is already up to date."
  exit 0
fi

FILE="opencomic_${LATEST_VERSION}_${ARCH}.deb"
URL="https://github.com/$REPO/releases/download/v${LATEST_VERSION}/${FILE}"

TMP=$(mktemp --suffix=.deb)

echo
echo "Downloading OpenComic $LATEST_VERSION..."
wget --show-progress -O "$TMP" "$URL"

echo
echo "Installing..."
sudo apt install -y "$TMP"

rm -f "$TMP"

echo
echo "✅ OpenComic $LATEST_VERSION installed successfully."
