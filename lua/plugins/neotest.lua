return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local neotest = require 'neotest'
    ---@diagnostic disable-next-line: missing-fields
    neotest.setup {
      -- ...,
      adapters = {
        -- ...,
        require 'rustaceanvim.neotest',
      },
    }

    vim.keymap.set('n', '<leader>tn', function()
      neotest.run.run()
    end, { desc = 'Test nearest' })

    vim.keymap.set('n', '<leader>tk', function()
      neotest.run.stop()
    end, { desc = 'Kill test run' })

    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Test file' })

    vim.keymap.set('n', '<leader>tl', function()
      neotest.run.run_last()
    end, { desc = 'Test last' })

    vim.keymap.set('n', '<leader>td', function()
      ---@diagnostic disable-next-line: missing-fields
      neotest.run.run { strategy = 'dap' }
    end, { desc = 'Debug nearest' })

    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open { enter = true, auto_close = true }
    end, { desc = 'Open output' })

    vim.keymap.set('n', '<leader>tso', function()
      neotest.summary.open()
    end, { desc = 'Open summary' })

    vim.keymap.set('n', '<leader>tsc', function()
      neotest.summary.close()
    end, { desc = 'Close summary' })

    vim.keymap.set('n', '<leader>tst', function()
      neotest.summary.close()
    end, { desc = 'Toggle summary' })
  end,
}
