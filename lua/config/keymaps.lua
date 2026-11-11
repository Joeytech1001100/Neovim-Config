local map = vim.keymap.set

-- Clear search highlights on pressing Esc in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "<leader>tc", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.foldexpr = "getline(v:lnum)=~'^\\s*\\(//\\|#\\|--\\|/\\*\\|\\*\\)'?1:0"
  vim.wo.foldmethod = "expr"
  vim.wo.foldlevel = 0
  vim.wo.foldenable = not vim.wo.foldenable
end, { desc = "Toggle collapse comments" })
