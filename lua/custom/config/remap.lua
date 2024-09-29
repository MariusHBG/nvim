-- Put debug output here
vim.keymap.set('n', '<leader>md', function()
  --  print(string.format('%s/Tools/zls', vim.env.HOME))
end)

vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Disabled in favor of harpoon keymap
-- vim.keymap.set('n', '<C-s>', vim.cmd.write)

-- TODO: jump between current and previous file
-- Make CTRL-t fuzzy find
-- Change harpoon key maps for that
-- Fix block visual selection
-- CTRL-back for deleting word in insert mode

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
vim.keymap.set('x', '<leader>p', '"_dP')
