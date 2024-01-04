return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local opts = {
      options = {
        theme = 'catppuccin'
      }
    }

    require('lualine').setup(opts)
  end
}

