require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'jdtls', 'hls', 'cmake', 'pyright', 'ts_ls', 'bashls' },
  automatic_installation = true,
})

local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
})

vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.enable({ 'lua_ls', 'jdtls', 'hls', 'cmake', 'pyright', 'ts_ls', 'bashls'})

-- Keymaps
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover docs' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
