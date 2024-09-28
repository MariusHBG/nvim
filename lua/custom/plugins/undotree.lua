vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Change from diff to FC as diff is not supported on Windows
vim.g.undotree_DiffCommand = 'FC'
