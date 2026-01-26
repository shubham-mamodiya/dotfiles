-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local function dap(fn)
  return function(...)
    local ok, dap = pcall(require, "dap")
    if not ok then
      return
    end
    return dap[fn](...)
  end
end

local function dapui(fn)
  return function(...)
    local ok, dapui = pcall(require, "dapui")
    if not ok then
      return
    end
    return dapui[fn](...)
  end
end

-- DAP (LazyVim extras.dap.core provides <leader>d* defaults)

-- Run control
map("n", "<F5>", dap("continue"), { desc = "DAP Continue" }) -- F5
map("n", "<C-F5>", dap("restart"), { desc = "DAP Restart" }) -- Ctrl+F5
map("n", "<S-F5>", dap("terminate"), { desc = "DAP Terminate" }) -- Shift+F5
map("n", "<F6>", dap("pause"), { desc = "DAP Pause" }) -- F6
map("n", "<F7>", dap("run_last"), { desc = "DAP Run Last" }) -- F7

-- UI
map("n", "<F8>", dapui("toggle"), { desc = "DAP UI Toggle" }) -- F8
map({ "n", "x" }, "<A-F8>", dapui("eval"), { desc = "DAP UI Eval" }) -- Alt+F8

-- Breakpoints
map("n", "<F9>", dap("toggle_breakpoint"), { desc = "DAP Toggle Breakpoint" }) -- F9
map("n", "<S-F9>", function()
  local ok, dap = pcall(require, "dap")
  if not ok then
    return
  end
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" }) -- Shift+F9
map("n", "<C-F9>", function()
  local ok, dap = pcall(require, "dap")
  if not ok then
    return
  end
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP Log Point" }) -- Ctrl+F9
map("n", "<A-F9>", dap("clear_breakpoints"), { desc = "DAP Clear Breakpoints" }) -- Alt+F9

-- Stepping
map("n", "<F10>", dap("step_over"), { desc = "DAP Step Over" }) -- F10
map("n", "<F11>", dap("step_into"), { desc = "DAP Step Into" }) -- F11
map("n", "<S-F11>", dap("step_out"), { desc = "DAP Step Out" }) -- Shift+F11

-- Navigation
map("n", "<F12>", dap("run_to_cursor"), { desc = "DAP Run to Cursor" }) -- F12
map("n", "<A-F10>", dap("down"), { desc = "DAP Down" }) -- Alt+F10
map("n", "<A-F11>", dap("up"), { desc = "DAP Up" }) -- Alt+F11

-- Inspection
map("n", "<A-F7>", function()
  local ok, widgets = pcall(require, "dap.ui.widgets")
  if not ok then
    return
  end
  widgets.hover()

  -- Opened as a floating window. Force close with <Esc> if it sticks.
  vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = 0, silent = true, nowait = true })
end, { desc = "DAP Widgets Hover" }) -- Alt+F7
