-- ABOUTME: Custom colorscheme configuration for LazyVim
return {
  -- Configure LazyVim to load tokyonight-night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  -- Configure tokyonight theme settings
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- night, storm, day, moon
      styles = {
        comments = { italic = false },
      },
    },
  },
}
