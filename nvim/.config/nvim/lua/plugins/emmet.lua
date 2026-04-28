return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        },
      },
    },
  },
}
