-- Put debug output here
vim.keymap.set('n', '<leader>md', function()
  --  print(string.format('%s/Tools/zls', vim.env.HOME))
end)

-- Disabled in favor of harpoon keymap
-- vim.keymap.set('n', '<C-s>', vim.cmd.write)

vim.keymap.set('n', '<leader>w', vim.cmd.Ex)
