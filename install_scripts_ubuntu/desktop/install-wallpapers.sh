#!/usr/bin/env bash
set -e

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/state/wallpaper"

# wallpaper-next
cat >"$HOME/.local/bin/wallpaper-next" <<'EOF'
#!/usr/bin/env bash

BACKGROUNDS_DIR="$HOME/.local/share/backgrounds/"
CURRENT_LINK="$HOME/.local/state/wallpaper/current"

mapfile -d '' -t BACKGROUNDS < <(
  find "$BACKGROUNDS_DIR" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) \
    -print0 | sort -z
)

TOTAL=${#BACKGROUNDS[@]}
[[ $TOTAL -eq 0 ]] && exit 1

CURRENT=""
[[ -L "$CURRENT_LINK" ]] && CURRENT=$(readlink "$CURRENT_LINK")

INDEX=-1
for i in "${!BACKGROUNDS[@]}"; do
  [[ "${BACKGROUNDS[$i]}" == "$CURRENT" ]] && INDEX=$i && break
done

if [[ $INDEX -eq -1 ]]; then
  NEW="${BACKGROUNDS[0]}"
else
  NEW="${BACKGROUNDS[$(((INDEX + 1) % TOTAL))]}"
fi

ln -nsf "$NEW" "$CURRENT_LINK"

gsettings set org.gnome.desktop.background picture-uri "file://$NEW"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$NEW"

# notify-send -i "$NEW" "Wallpaper" "$(basename "$NEW")"
EOF

chmod +x "$HOME/.local/bin/wallpaper-next"

# wallpaper-prev
cat >"$HOME/.local/bin/wallpaper-prev" <<'EOF'
#!/usr/bin/env bash

BACKGROUNDS_DIR="$HOME/.local/share/backgrounds/"
CURRENT_LINK="$HOME/.local/state/wallpaper/current"

mapfile -d '' -t BACKGROUNDS < <(
  find "$BACKGROUNDS_DIR" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) \
    -print0 | sort -z
)

TOTAL=${#BACKGROUNDS[@]}
[[ $TOTAL -eq 0 ]] && exit 1

CURRENT=""
[[ -L "$CURRENT_LINK" ]] && CURRENT=$(readlink "$CURRENT_LINK")

INDEX=-1
for i in "${!BACKGROUNDS[@]}"; do
  [[ "${BACKGROUNDS[$i]}" == "$CURRENT" ]] && INDEX=$i && break
done

if [[ $INDEX -eq -1 ]]; then
  NEW="${BACKGROUNDS[0]}"
else
  NEW="${BACKGROUNDS[$(((INDEX - 1 + TOTAL) % TOTAL))]}"
fi

ln -nsf "$NEW" "$CURRENT_LINK"

gsettings set org.gnome.desktop.background picture-uri "file://$NEW"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$NEW"

# notify-send -i "$NEW" "Wallpaper" "$(basename "$NEW")"
EOF

chmod +x "$HOME/.local/bin/wallpaper-prev"

# wallpaper-random
cat >"$HOME/.local/bin/wallpaper-random" <<'EOF'
#!/usr/bin/env bash

BACKGROUNDS_DIR="$HOME/.local/share/backgrounds/"
CURRENT_LINK="$HOME/.local/state/wallpaper/current"

mapfile -d '' -t BACKGROUNDS < <(
  find "$BACKGROUNDS_DIR" -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) \
    -print0 | sort -z
)

TOTAL=${#BACKGROUNDS[@]}
[[ $TOTAL -eq 0 ]] && exit 1

CURRENT=""
[[ -L "$CURRENT_LINK" ]] && CURRENT=$(readlink "$CURRENT_LINK")

if [[ $TOTAL -eq 1 ]]; then
  NEW="${BACKGROUNDS[0]}"
else
  while :; do
    NEW="${BACKGROUNDS[$((RANDOM % TOTAL))]}"
    [[ "$NEW" != "$CURRENT" ]] && break
  done
fi

ln -nsf "$NEW" "$CURRENT_LINK"

gsettings set org.gnome.desktop.background picture-uri "file://$NEW"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$NEW"

# notify-send -i "$NEW" "Wallpaper" "$(basename "$NEW")"
EOF

chmod +x "$HOME/.local/bin/wallpaper-random"

echo "Wallpaper scripts installed successfully."
echo
echo "Installed:"
echo "  ~/.local/bin/wallpaper-next"
echo "  ~/.local/bin/wallpaper-prev"
echo "  ~/.local/bin/wallpaper-random"
echo
echo "Wallpaper directory:"
echo "  ~/.local/share/backgrounds/"
echo
echo "Make sure ~/.local/bin is in your PATH."
