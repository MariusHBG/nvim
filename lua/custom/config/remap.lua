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
