return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Git Diff" },
      { "<leader>gD", "<cmd>DiffviewClose<CR>", desc = "Close Git Diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Branch History" },
    },
    opts = {},
  },
}
