return {
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width = 100,
      max_height = 25,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    ft = { "markdown" },
    opts = {
      renderer_options = {
        mermaid = {
          theme = "dark",
          scale = 2,
        },
        plantuml = {
          charset = "utf-8",
        },
        d2 = {
          theme_id = 1,
        },
        gnuplot = {
          theme = "dark",
        },
      },
    },
    config = function(_, opts)
      require("diagram").setup(vim.tbl_deep_extend("force", opts, {
        integrations = {
          require("diagram.integrations.markdown"),
        },
      }))
    end,
    keys = {
      {
        "<leader>td",
        function()
          require("diagram").show_diagram_hover()
        end,
        mode = "n",
        ft = "markdown",
        desc = "Show diagram at cursor",
      },
    },
  },
}
