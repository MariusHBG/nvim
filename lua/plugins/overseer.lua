return {
  'stevearc/overseer.nvim',
  opts = {},
  keys = {
    { '<leader>ot', vim.cmd.OverseerToggle, desc = '[O]verseer [t]oggle' },
    { '<leader>or', vim.cmd.OverseerRun, desc = '[O]verseer [r]un' },
  },
}
