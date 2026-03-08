vim.keymap.set("n", "<leader>aa", function()
  pcall(vim.cmd, "Neotree close")
  vim.cmd("enew")
  pcall(require("alpha").start, true)
end, { desc = "Dashboard Alpha", silent = true })

vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", { desc = "Explorador", silent = true })
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Enfocar", silent = true })
vim.keymap.set("n", "<leader>bf", ":Neotree buffers<CR>", { desc = "Buffers", silent = true })
