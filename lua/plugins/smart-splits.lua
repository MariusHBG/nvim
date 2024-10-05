return {
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      -- recommended mappings
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right)
      -- moving between splits
      vim.keymap.set('n', '<C-Left>', require('smart-splits').move_cursor_left)
      vim.keymap.set('n', '<C-Down>', require('smart-splits').move_cursor_down)
      vim.keymap.set('n', '<C-Up>', require('smart-splits').move_cursor_up)
      vim.keymap.set('n', '<C-Right>', require('smart-splits').move_cursor_right)
      vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
      -- swapping buffers between windows
      vim.keymap.set('n', '<leader><leader><Left>', require('smart-splits').swap_buf_left)
      vim.keymap.set('n', '<leader><leader><Down>', require('smart-splits').swap_buf_down)
      vim.keymap.set('n', '<leader><leader><Up>', require('smart-splits').swap_buf_up)
      vim.keymap.set('n', '<leader><leader><Right>', require('smart-splits').swap_buf_right)
    end,
  },
}
