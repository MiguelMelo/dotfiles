return { 
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin", 
  priority = 1000,
  config = function()
    local opts = {
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#0b0b11",
          mantle = "#0b0b11",
          crust = "#0b0b11"
        } 
      }
    }

    require('catppuccin').setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end
}
