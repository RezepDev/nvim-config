vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map space to <NOP> for normal, visual, select, and operator-pending modes
vim.keymap.set({ 'n', 'v', 'x', 'o' }, '<Space>', '<Nop>', { silent = true })


require("config.lazy")
require("config.keymaps")
vim.opt.clipboard = "unnamedplus"

-- Define the appearance of the column
-- %s = signs (errors/warnings), %= = right align, %l = line number
-- The '┃' character is your solid vertical bar.
vim.opt.statuscolumn = "%= %l %s┃"

-- Customize the color of the vertical bar
-- This links it to the standard vertical split color, or you can set a custom hex color
vim.api.nvim_set_hl(0, "StatusColumnSeparator", { link = "WinSeparator" })

vim.opt.number = true

-- Make nvim use 2 spaces for tab like they like it on Google 
vim.opt.tabstop = 2      -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 2  -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.shiftwidth = 2   -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Convert tabs to spaces


-- Make vim wrap all content it cannot render
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TerminalWrap", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
  end,
})

