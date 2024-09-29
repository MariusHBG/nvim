return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup()
    vim.keymap.set('n', '<Leader>ls', require('auto-session.session-lens').search_session, { noremap = true, desc = '[L]ist current [S]essions' })
  end,
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
