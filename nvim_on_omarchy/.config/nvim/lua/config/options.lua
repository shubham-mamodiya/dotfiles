-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.spell = true
vim.opt.spelllang = { "en" }
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.g.snacks_animate = false
vim.opt.winbar = "%=%m %f"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
vim.opt.formatoptions:append("t")
