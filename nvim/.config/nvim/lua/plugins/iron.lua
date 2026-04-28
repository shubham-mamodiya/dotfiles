return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,

        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = { PYTHON_BASIC_REPL = "1" }, -- needed for python >=3.13
          },
        },

        repl_filetype = function(_, ft)
          return ft
        end,

        repl_open_cmd = view.split.vertical.botright(40),

        dap_integration = false,
      },

      keymaps = {
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rR",

        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_line = "<leader>sl",
        send_file = "<leader>sf",
        send_paragraph = "<leader>sp",
        send_until_cursor = "<leader>su",

        send_code_block = "<leader>sb",
        send_code_block_and_move = "<leader>sn",

        interrupt = "<leader>s<space>",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },

      highlight = {
        italic = true,
      },

      ignore_blank_lines = true,
    })

    vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<CR>")
    vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<CR>")
  end,
}
