# DAP keymaps (LazyVim)

This setup uses LazyVim’s `lazyvim.plugins.extras.dap.core` for the default DAP/DAP UI configuration, and adds extra function-key mappings in `lua/config/keymaps.lua`.

## What’s enabled by LazyVim

- Extra: `lazyvim.plugins.extras.dap.core` (enabled in `~/.config/nvim/lazyvim.json`)
- Includes: `nvim-dap`, `nvim-dap-ui`, `nvim-dap-virtual-text`, `mason-nvim-dap.nvim`
- DAP UI behavior: auto-opens on session start, auto-closes on session end
- VS Code launch configs: supports `.vscode/launch.json` (with comment stripping)

Reference: https://www.lazyvim.org/extras/dap/core

## Custom function-key mappings

Defined in `~/.config/nvim/lua/config/keymaps.lua`.

Run control
- `F5` continue
- `Ctrl+F5` restart session
- `Shift+F5` terminate
- `F6` pause
- `F7` run last
- `F8` toggle DAP UI

Breakpoints
- `F9` toggle breakpoint
- `Shift+F9` conditional breakpoint prompt
- `Ctrl+F9` log point prompt
- `Alt+F9` clear all breakpoints

Stepping / navigation
- `F10` step over
- `F11` step into
- `Shift+F11` step out
- `F12` run to cursor
- `Alt+F10` stack down
- `Alt+F11` stack up

Inspection
- `Alt+F7` DAP hover widgets
- `Alt+F8` eval in DAP UI (normal/visual)

## Notes

- LazyVim still provides the default `<leader>d*` mappings. The function keys are just extra.
- Virtual text: `nvim-dap-virtual-text` is included by `dap.core` with default `opts = {}`. It only shows during an active debug session when the adapter provides values.
- UI behavior: `nvim-dap-ui` auto-opens when a debug session starts and auto-closes on terminate/exit.
- VS Code configs: LazyVim configures `dap.ext.vscode.json_decode` to allow comment-stripping in `.vscode/launch.json`.
- Ghostty/Hyprland: Omarchy’s Hyprland bindings are mostly `SUPER`-based; no conflicts were found with `F5/F8/F9/F10/F11/F12` or the modifiers above.
- `.claud` directory: not found in `/home/nuts` during inspection.
- The mappings use `pcall(require, ...)` so pressing them before DAP loads won’t error.
