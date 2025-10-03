return {
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
		-- stylua: ignore
    keys = {

      -- recommended mappings
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      { '<A-Left>', function() require('smart-splits').resize_left() end, },
      { '<A-Down>', function() require('smart-splits').resize_down() end, },
      { '<A-Up>', function() require('smart-splits').resize_up() end, },
      { '<A-Right>', function() require('smart-splits').resize_right() end, },
      { '<A-h>', function() require('smart-splits').resize_left() end, },
      { '<A-j>', function() require('smart-splits').resize_down() end, },
      { '<A-k>', function() require('smart-splits').resize_up() end, },
      { '<A-l>', function() require('smart-splits').resize_right() end, },

      -- moving between splits
			-- Up
      { '<C-k>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_up() end, },
      { '<C-Up>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_up() end, },
			-- Down
      { '<C-h>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_left() end, },
			{ '<C-j>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_down() end, },
			-- Left
      { '<C-Down>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_down() end, },
      { '<C-Left>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_left() end, },
			-- Right
      { '<C-l>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_right() end, },
      { '<C-Right>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_right() end, },
			-- Previous
      { '<C-\\>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').move_cursor_previous() end, },
			-- Split horizontally
      { '<C-w>h', mode = { 'n', 'i', 'v' }, function() vim.cmd.split() end, desc = 'Split window horizontally', },

      -- swapping buffers between windows
      { '<C-w>s<Left>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_left() end, desc = 'Move window to the left', },
      { '<C-w>s<Right>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_right() end, desc = 'Move window to the right', },
      { '<C-w>s<Up>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_up() end, desc = 'Move window to the top', },
      { '<C-w>s<Down>', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_down() end, desc = 'Move window to the bottom', },
      { '<C-w>sh', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_left() end, desc = 'Move window to the left', },
      { '<C-w>sl', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_right() end, desc = 'Move window to the right', },
      { '<C-w>sk', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_up() end, desc = 'Move window to the top', },
      { '<C-w>sj', mode = { 'n', 'i', 'v' }, function() require('smart-splits').swap_buf_down() end, desc = 'Move window to the bottom', },
    },
    config = function()
      require('smart-splits').setup { at_edge = 'stop' }
    end,
  },
}
