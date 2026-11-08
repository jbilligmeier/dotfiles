-- ABOUTME: Custom vim options that override LazyVim defaults
-- Add any vim.opt or vim.g settings here to customize your LazyVim setup

-- Example: Set relative line numbers (LazyVim has this by default, but showing how to override)
-- vim.opt.relativenumber = true

-- Example: Change the update time for better responsiveness
-- vim.opt.updatetime = 200

-- Example: Set a custom leader key (not recommended to change, but possible)
-- vim.g.mapleader = " "

-- Add your custom options below:

-- Enable OSC 52 clipboard for copy/paste over SSH (works through Termius)
-- This makes yank (y) automatically copy to Mac clipboard via escape sequences
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

-- Enable mouse mode so you can click to position cursor and select text
vim.opt.mouse = "a"

-- Map Ctrl+C in visual mode to copy (Cmd+C doesn't work through Termius)
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy with Ctrl+C', silent = true })

-- Set text width to 80 for markdown files with proper list indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("n") -- Recognize numbered lists
    -- Pattern for numbered lists (1. or 1)) and bullet points (-, *, +)
    vim.opt_local.formatlistpat = "^\\s*\\(\\d\\+[.)]\\|[-*+]\\)\\s\\+"
  end,
})
