vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },		
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "navarasu/onedark.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
  { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
  { "junegunn/fzf.vim" },
  { "akinsho/toggleterm.nvim", config = function()
      require("toggleterm").setup()
      vim.keymap.set({'n', 't'}, '<C-\\>', '<Cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
  end },
  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
      require("nvim-tree").setup({})
  end,
},
  
})

require('lucas.remap')
require('lucas.lsp')

vim.opt.termguicolors = true
vim.o.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.clipboard = {
  copy  = { ["+"] = "wl-copy", ["*"] = "wl-copy --primary" },
  paste = { ["+"] = "wl-paste", ["*"] = "wl-paste --primary" },
}
