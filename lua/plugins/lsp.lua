return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Keymaps applied only when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, opts)
	end,
      })

      -- Capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Clangd configuration with GCC driver query
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--query-driver=/usr/bin/c++,/usr/bin/g++,/usr/bin/*",
        },
	init_options = {
          fallbackFlags = {
            "-std=c++20",
            "-x",
            "c++-header",
            "-I/usr/include/c++/15",
            "-I/usr/include/x86_64-linux-gnu/c++/15",
            "-I/usr/include/c++/15/backward",
          },
        },
      })

      -- Lua configuration
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- Mason package management
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "lua_ls",
        },
      })

      -- Enable servers
      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")
    end,
  },
}
