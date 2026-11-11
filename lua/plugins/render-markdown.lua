return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
    ft = { "markdown" },
    opts = { 
        anti_conceal = { enabled = false },
        pipe_table = { preset = 'heavy' },
    },
    keys = {
      { "<leader>tm", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle Markdown Render", ft = "markdown" },
    },
  },
}
