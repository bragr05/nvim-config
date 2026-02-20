-- Alpha Dashboard
vim.keymap.set('n', '<leader>aa', function()
  -- Cierra Neo-tree si está abierto
  pcall(vim.cmd, 'Neotree close')
  -- Crea un nuevo buffer vacío
  vim.cmd('enew')
  -- Abre Alpha
  pcall(require('alpha').start, true)
end, { desc = "Dashboard Alpha", silent = true })

-- Neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', { desc = "Explorador", silent = true })
vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = "Enfocar", silent = true })
vim.keymap.set('n', '<leader>bf', ':Neotree buffers<CR>', { desc = "Buffers", silent = true })
