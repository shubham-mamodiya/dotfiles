-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")
-- Unbind the default Nautilus launcher
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + SHIFT + C", "Calendar", { webapp = "https://app.hey.com/calendar/weeks/" })
hl.unbind("SUPER + SHIFT + ALT + A", "Grok", { webapp = "https://grok.com" })
hl.unbind("SUPER + SHIFT + M", "Music", { omarchy = "spotify" })
hl.unbind("SUPER + SHIFT + G", "Signal", { omarchy = "signal" })
hl.unbind("SUPER + SHIFT + SLASH", "Passwords", { omarchy = "1password" })
hl.unbind("SUPER + SHIFT + Y", "YouTube", { webapp = "https://youtube.com/" })
hl.unbind("SUPER + SHIFT + ALT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
hl.unbind( "SUPER + SHIFT + CTRL + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
hl.unbind("SUPER + SHIFT + P", "Google Photos", { webapp = "https://photos.google.com/", focus = true })
hl.unbind("SUPER + SHIFT + S", "Google Maps", { webapp = "https://maps.google.com/", focus = true })
hl.unbind("SUPER + SHIFT + X", "X", { webapp = "https://x.com/" })
hl.unbind("SUPER + SHIFT + ALT + X", "X Post", { webapp = "https://x.com/compose/post" })
hl.unbind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { omarchy = "nautilus-cwd" })
  --
-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
-- Essential application bindings.
o.bind("SUPER + SHIFT + F", "File manager", "xdg-terminal-exec yazi")
o.bind("SUPER + SHIFT + Y", "File manager", {omarchy = "nautilus"})
o.bind("SUPER + SHIFT + ALT + A", "gemini", { webapp = "https://gemini.google.com" })
  --
