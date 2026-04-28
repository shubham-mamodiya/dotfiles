return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },

    config = function()
      require("flutter-tools").setup({
        fvm = true,
        flutter_path = ".fvm/flutter_sdk/bin/flutter",
      })
    end,
  },
}
