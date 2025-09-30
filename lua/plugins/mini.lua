return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_filename = function()
      if vim.bo.buftype == 'terminal' then
        return '%t'
      else
        return '%f%m%r'
      end
    end

    require('mini.pairs').setup()

    require('mini.bufremove').setup()

    local bufremove = require 'mini.bufremove'
    local function delete_all_other_bufs()
      local current_buf = vim.api.nvim_get_current_buf()
      local bufs = vim.api.nvim_list_bufs()
      local current_buf_name = vim.api.nvim_buf_get_name(0)
      for i = 1, #bufs do
        local buf = bufs[i]
        local is_current_buffer = buf == current_buf
        local is_file_tree_buffer = current_buf_name:match 'NvimTree_1' == 'NvimTree_1'
        local is_buf_listed = vim.bo[buf].buflisted
        if not is_current_buffer and not is_file_tree_buffer and is_buf_listed then
          bufremove.delete(buf, true)
        end
      end
    end

    vim.keymap.set('n', '<leader>bd', bufremove.delete, { desc = '[B]uffer [delete]' })
    vim.keymap.set('n', '<leader>bo', delete_all_other_bufs, { desc = '[B]uffer delete [o]thers' })

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
