return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      floating_window = false,
      floating_window_above_cur = true,
      hint_enable = false, -- keeps virtual inline text disabled
      handler_opts = {
        border = "rounded",
      },
      -- Keymap to cycle overloads while typing in insert mode
      select_signature_key = "<C-s>",
    },
    keys = {
      { "<C-k>", function() require("lsp_signature").toggle_float_win() end, mode = "i" },
    },
  },
}
