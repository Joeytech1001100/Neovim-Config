return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-]>",
          prev = false,
          dismiss = "<C-\\>",
        },
      },
      panel = { enabled = false },
    },
    keys = {
      {
        "<leader>tp",
        function()
          require("copilot.suggestion").toggle_auto_trigger()
        end,
        desc = "Toggle Copilot Ghost Text",
      },
      {
        "<C-p>",
        function()
          require("copilot.suggestion").toggle_auto_trigger()
        end,
        mode = "i",
        desc = "Toggle Copilot Ghost Text (Insert)",
      },
    },
  },
}
