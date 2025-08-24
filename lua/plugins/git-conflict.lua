---@diagnostic disable: missing-fields
return {
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    keys = {
      { '<leader>gq', '<cmd>GitConflictListQf<CR>', desc = 'Get all git conflicts to quick fix' },
    },
    config = function()
      require('git-conflict').setup {
        default_mappings = {
          ours = '<leader>co',
          theirs = '<leader>ct',
          none = '<leader>c0',
          both = '<leader>cb',
          next = '<leader>cn',
          prev = '<leader>cp',
        },
        default_commands = true,
        disable_diagnostics = true,
        list_opener = 'copen', -- command or function to open the conflicts list
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = 'DiffAdd',
          current = 'DiffText',
        },
      }
    end,
  },
}
