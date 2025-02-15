-- netrw was disabled in nvim-tree.lua
-- vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Disabled in favor of harpoon keymap
-- vim.keymap.set('n', '<C-s>', vim.cmd.write)

-- Modified this file to test the rebase in lazygit
-- TODO: jump between current and previous file
-- Make CTRL-t fuzzy find
-- Change harpoon key maps for that
-- Fix block visual selection

-- To quickly correct spelling errors directly in insert mode
-- Unfortunately, remapping CTRL-BS does not work
vim.keymap.set('i', '<C-b>', '<C-w>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>wq', vim.diagnostic.setqflist, { desc = 'Open [W]orkspace diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move selected blocks, same as resharper mapping
vim.keymap.set('v', '<C-S-A-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<C-S-A-Down>', ":m '>+1<CR>gv=gv")

-- Makes cursor stay in place when doing J (it puts the line below in the current line with a whitespace)
vim.keymap.set('n', 'J', 'mzJ`z')

-- Places cursor in vertical center when scrolling half-page up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Places cursor in vertical center when seaching file
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Avoids that default paste register gets overwritten with replaced content when pasting
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste but yank into void register' })

-- Toggle lsp highlight
vim.keymap.set('n', '<leader>di', '<cmd>lua require("marius/remap").LspSwap()<CR>', { noremap = true, desc = 'Toggle diagnostics' })

local M = {}

function M.LspSwap()
  print 'In LSP Swap'
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end

return M
