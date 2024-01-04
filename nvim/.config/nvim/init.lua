local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.autoindent = true
opt.smartindent = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)

require("catppuccin").setup({
  flavour = "mocha",
  color_overrides = {
    mocha = {
      base = "#0b0b11",
      mantle = "#0b0b11",
      crust = "#0b0b11"
    } 
  }
})

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "lua", "javascript", "typescript" },
  highlight = { enable = true },
  indent = { enable = true },
})

local builtin = require('telescope.builtin')

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader> ', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>e', ':Neotree toggle filesystem reveal left<CR>', {})

vim.cmd.colorscheme "catppuccin"
