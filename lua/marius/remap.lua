local function set_move_bufs_keymaps()
  -- Buffer movements
  -- Next/Previous
  vim.keymap.set('n', 'gn', ':bnext<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'gp', ':bprev<CR>', { noremap = true, silent = true })
  -- Go to buffer by number
  for i = 1, 9 do
    -- Buffers start at 2 (probably because of nvim_tree)
    local buf_num = i + 1
    vim.keymap.set('n', 'g' .. i, ':buffer ' .. buf_num .. '<CR>', { noremap = true, silent = true })
  end
end

local function set_line_moves_keymaps()
  vim.keymap.set('n', 'gh', '0', { noremap = true })
  vim.keymap.set('n', 'gs', '^', { noremap = true })
  vim.keymap.set('n', 'gl', '$', { noremap = true })
end

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
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic location list' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setqflist, { desc = 'Open workspace diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cq', '<cmd>lclose|cclose<return>', { desc = '[C]lose diagnostic quickfix and location list' })

vim.diagnostic.config { virtual_text = true }
local is_virtual_lines_enabled = false
vim.keymap.set('n', '<leader>dv', function()
  print(vim.diagnostic.config)
  is_virtual_lines_enabled = not is_virtual_lines_enabled
  vim.diagnostic.config { virtual_lines = is_virtual_lines_enabled, virtual_text = not is_virtual_lines_enabled }
end, { desc = '[D]iagnostic toggle [V]irtual lines' })

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
vim.keymap.set('n', '<leader>dt', '<cmd>lua require("marius/remap").LspSwap()<CR>', { noremap = true, desc = 'Toggle diagnostics' })

set_move_bufs_keymaps()
set_line_moves_keymaps()

-- Save file
vim.keymap.set('', '<C-s>', '<cmd>:w<CR>')

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
