-- Search files
vim.keymap.set('n', '<leader>ff', ':Files<CR>')

-- Search open buffers
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>')

-- Search with ripgrep (requires ripgrep installed)
vim.keymap.set('n', '<leader>fg', ':Rg<CR>')

-- Search command history
vim.keymap.set('n', '<leader>fh', ':History<CR>')
