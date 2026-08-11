#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="$HOME/.local/bin"
WALLPAPER_DIR="$HOME/.local/share/backgrounds"
STATE_DIR="$HOME/.local/state/wallpaper"
CURRENT_LINK="$STATE_DIR/current"

# ------------------------------------------------------------
# Requirements
# ------------------------------------------------------------

if ! command -v plasma-apply-wallpaperimage >/dev/null 2>&1; then
  echo "Error: plasma-apply-wallpaperimage was not found."
  echo "This installer is intended for KDE Plasma / Kubuntu."
  exit 1
fi

# ------------------------------------------------------------
# Directories
# ------------------------------------------------------------

mkdir -p "$BIN_DIR"
mkdir -p "$WALLPAPER_DIR"
mkdir -p "$STATE_DIR"

# ------------------------------------------------------------
# wallpaper-set
# ------------------------------------------------------------

cat >"$BIN_DIR/wallpaper-set" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

CURRENT_LINK="$HOME/.local/state/wallpaper/current"
IMAGE="${1:-}"

if [[ -z "$IMAGE" ]]; then
    echo "Usage: wallpaper-set /path/to/image"
    exit 1
fi

if [[ ! -f "$IMAGE" ]]; then
    echo "Error: file does not exist:"
    echo "$IMAGE"
    exit 1
fi

IMAGE="$(realpath "$IMAGE")"

plasma-apply-wallpaperimage "$IMAGE"

mkdir -p "$(dirname "$CURRENT_LINK")"
ln -sfn "$IMAGE" "$CURRENT_LINK"
EOF

chmod +x "$BIN_DIR/wallpaper-set"

# ------------------------------------------------------------
# wallpaper-next
# ------------------------------------------------------------

cat >"$BIN_DIR/wallpaper-next" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="$HOME/.local/bin"
WALLPAPER_DIR="$HOME/.local/share/backgrounds"
CURRENT_LINK="$HOME/.local/state/wallpaper/current"

mapfile -d '' -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -type f \
        \( \
            -iname '*.jpg' \
            -o -iname '*.jpeg' \
            -o -iname '*.png' \
            -o -iname '*.webp' \
        \) \
        -print0 |
        sort -z
)

TOTAL="${#WALLPAPERS[@]}"

if (( TOTAL == 0 )); then
    echo "No wallpapers found in:"
    echo "$WALLPAPER_DIR"
    exit 1
fi

CURRENT=""

if [[ -L "$CURRENT_LINK" ]]; then
    CURRENT="$(readlink -f "$CURRENT_LINK")"
fi

INDEX=-1

for i in "${!WALLPAPERS[@]}"; do
    if [[ "${WALLPAPERS[$i]}" == "$CURRENT" ]]; then
        INDEX="$i"
        break
    fi
done

if (( INDEX == -1 )); then
    NEW="${WALLPAPERS[0]}"
else
    NEW="${WALLPAPERS[$(((INDEX + 1) % TOTAL))]}"
fi

"$BIN_DIR/wallpaper-set" "$NEW"
EOF

chmod +x "$BIN_DIR/wallpaper-next"

# ------------------------------------------------------------
# wallpaper-prev
# ------------------------------------------------------------

cat >"$BIN_DIR/wallpaper-prev" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="$HOME/.local/bin"
WALLPAPER_DIR="$HOME/.local/share/backgrounds"
CURRENT_LINK="$HOME/.local/state/wallpaper/current"

mapfile -d '' -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -type f \
        \( \
            -iname '*.jpg' \
            -o -iname '*.jpeg' \
            -o -iname '*.png' \
            -o -iname '*.webp' \
        \) \
        -print0 |
        sort -z
)

TOTAL="${#WALLPAPERS[@]}"

if (( TOTAL == 0 )); then
    echo "No wallpapers found in:"
    echo "$WALLPAPER_DIR"
    exit 1
fi

CURRENT=""

if [[ -L "$CURRENT_LINK" ]]; then
    CURRENT="$(readlink -f "$CURRENT_LINK")"
fi

INDEX=-1

for i in "${!WALLPAPERS[@]}"; do
    if [[ "${WALLPAPERS[$i]}" == "$CURRENT" ]]; then
        INDEX="$i"
        break
    fi
done

if (( INDEX == -1 )); then
    NEW="${WALLPAPERS[0]}"
else
    NEW="${WALLPAPERS[$(((INDEX - 1 + TOTAL) % TOTAL))]}"
fi

"$BIN_DIR/wallpaper-set" "$NEW"
EOF

chmod +x "$BIN_DIR/wallpaper-prev"

# ------------------------------------------------------------
# wallpaper-random
# ------------------------------------------------------------

cat >"$BIN_DIR/wallpaper-random" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="$HOME/.local/bin"
WALLPAPER_DIR="$HOME/.local/share/backgrounds"
CURRENT_LINK="$HOME/.local/state/wallpaper/current"

mapfile -d '' -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -type f \
        \( \
            -iname '*.jpg' \
            -o -iname '*.jpeg' \
            -o -iname '*.png' \
            -o -iname '*.webp' \
        \) \
        -print0 |
        sort -z
)

TOTAL="${#WALLPAPERS[@]}"

if (( TOTAL == 0 )); then
    echo "No wallpapers found in:"
    echo "$WALLPAPER_DIR"
    exit 1
fi

CURRENT=""

if [[ -L "$CURRENT_LINK" ]]; then
    CURRENT="$(readlink -f "$CURRENT_LINK")"
fi

if (( TOTAL == 1 )); then
    NEW="${WALLPAPERS[0]}"
else
    while true; do
        NEW="${WALLPAPERS[$((RANDOM % TOTAL))]}"

        if [[ "$NEW" != "$CURRENT" ]]; then
            break
        fi
    done
fi

"$BIN_DIR/wallpaper-set" "$NEW"
EOF

chmod +x "$BIN_DIR/wallpaper-random"

# ------------------------------------------------------------
# Done
# ------------------------------------------------------------

echo
echo "Wallpaper scripts installed successfully."
echo
echo "Installed commands:"
echo "  wallpaper-set"
echo "  wallpaper-next"
echo "  wallpaper-prev"
echo "  wallpaper-random"
echo
echo "Wallpaper directory:"
echo "  $WALLPAPER_DIR"
echo
echo "State directory:"
echo "  $STATE_DIR"
echo
echo "Test with:"
echo "  wallpaper-next"
echo "  wallpaper-prev"
echo "  wallpaper-random"
