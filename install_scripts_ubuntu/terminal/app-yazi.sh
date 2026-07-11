#!/usr/bin/env bash
set -Eeuo pipefail

REPO="sxyazi/yazi"
ARCH="x86_64-unknown-linux-gnu"

echo "==> Installing dependencies..."
sudo apt update
sudo apt install -y curl jq unzip

echo "==> Fetching latest Yazi release..."
LATEST_TAG=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name')

if [[ -z "$LATEST_TAG" || "$LATEST_TAG" == "null" ]]; then
  echo "Failed to determine the latest release."
  exit 1
fi

echo "Latest version: ${LATEST_TAG}"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

ZIP_NAME="yazi-${ARCH}.zip"
DOWNLOAD_URL="https://github.com/${REPO}/releases/download/${LATEST_TAG}/${ZIP_NAME}"

echo "==> Downloading..."
curl -fL "$DOWNLOAD_URL" -o "${TMP_DIR}/${ZIP_NAME}"

echo "==> Extracting..."
unzip -q "${TMP_DIR}/${ZIP_NAME}" -d "$TMP_DIR"

echo "==> Installing..."
sudo install -Dm755 "${TMP_DIR}/yazi-${ARCH}/yazi" /usr/local/bin/yazi
sudo install -Dm755 "${TMP_DIR}/yazi-${ARCH}/ya" /usr/local/bin/ya

echo
echo "Installed successfully!"
echo

yazi --version
ya --version
