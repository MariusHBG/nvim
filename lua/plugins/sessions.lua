return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      post_restore_cmds = {
        function()
          -- restore nvim-tree after a session is restored
          local nvim_tree_api = require 'nvim-tree.api'
          nvim_tree_api.tree.open()
          nvim_tree_api.tree.change_root(vim.fn.getcwd())
          nvim_tree_api.tree.reload()
        end,
      },
    }
    vim.keymap.set('n', '<Leader>ls', require('auto-session.session-lens').search_session, { noremap = true, desc = '[L]ist current [S]essions' })
  end,
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
