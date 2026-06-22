return {
  'stevearc/overseer.nvim',
  config = function(_, opts)
    local overseer = require 'overseer'

    overseer.setup(opts)

    overseer.register_template {
      name = 'pnpm build',
      builder = function()
        return {
          cmd = { 'pnpm', 'build' },
          components = {
            { 'on_output_parse', problem_matcher = '$tsc' },
            { 'on_result_diagnostics_quickfix', open = true },
            'default',
          },
        }
      end,
    }

    vim.api.nvim_create_user_command('OverseerRunCustom', function()
      vim.ui.input({ prompt = 'Run: ' }, function(cmd)
        if not cmd or cmd == '' then
          return
        end

        local task = require('overseer').new_task {
          name = cmd,
          cmd = cmd,
          components = { 'default' },
        }

        task:start()
      end)
    end, {})
  end,
  keys = {
    { '<leader>ot', vim.cmd.OverseerToggle, desc = '[O]verseer [t]oggle' },
    { '<leader>or', vim.cmd.OverseerRun, desc = '[O]verseer [r]un' },
    { '<leader>oc', '<cmd>OverseerRunCustom<CR>', desc = '[O]verseer run [c]ustom command' },
  },
}
