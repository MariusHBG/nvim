return {
  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    config = function()
      local smart_splits = require 'smart-splits'

      smart_splits.setup { at_edge = 'stop' }

      -- recommended mappings
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right)

      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

      -- moving between splits
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-l>', require('smart-splits').move_cursor_right)

      vim.keymap.set({ 'n', 'i', 'v' }, '<C-Left>', require('smart-splits').move_cursor_left)
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-Down>', require('smart-splits').move_cursor_down)
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-Up>', require('smart-splits').move_cursor_up)
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-Right>', require('smart-splits').move_cursor_right)

      vim.keymap.set({ 'n', 'i', 'v' }, '<C-\\>', require('smart-splits').move_cursor_previous)

      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>h', vim.cmd.split, { desc = 'Split window horizontally' })

      -- swapping buffers between windows
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>s<Left>', smart_splits.swap_buf_left, { desc = 'Move window to the left' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>s<Right>', smart_splits.swap_buf_right, { desc = 'Move window to the right' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>s<Up>', smart_splits.swap_buf_up, { desc = 'Move window to the top' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>s<Down>', smart_splits.swap_buf_down, { desc = 'Move window to the bottom' })

      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>sh', smart_splits.swap_buf_left, { desc = 'Move window to the left' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>sl', smart_splits.swap_buf_right, { desc = 'Move window to the right' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>sk', smart_splits.swap_buf_up, { desc = 'Move window to the top' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>sj', smart_splits.swap_buf_down, { desc = 'Move window to the bottom' })
    end,
  },
}
