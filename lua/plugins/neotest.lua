return {
  'nvim-neotest/neotest',
  lazy = true,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>ta',
      function()
        require('neotest').run.run { suite = true }
      end,
      desc = '[T]est [a]ll',
    },
    {
      '<leader>tn',
      function()
        require('neotest').run.run()
      end,
      desc = '[T]est [n]earest',
    },
    {
      '<leader>tk',
      function()
        require('neotest').run.stop()
      end,
      desc = '[T]est [k]ill run',
    },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[T]est [f]ile',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = '[T]est [l]ast',
    },
    {
      '<leader>td',
      function()
        ---@diagnostic disable-next-line: missing-fields
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = '[T]est [d]ebug nearest',
    },

    {
      '<leader>to',
      function()
        require('neotest').output.open { enter = true, auto_close = true }
      end,
      desc = '[T]est open [o]utput',
    },

    {
      '<leader>tso',
      function()
        require('neotest').summary.open()
      end,
      desc = '[T]est [s]ummary [o]pen',
    },

    {
      '<leader>tsc',
      function()
        require('neotest').summary.close()
      end,
      desc = '[T]est [s]ummary [c]lose',
    },

    {
      '<leader>tst',
      function()
        require('neotest').summary.close()
      end,
      desc = 'Toggle summary',
    },

    {
      '<leader>tww',
      function()
        require('neotest').watch.watch(vim.fn.expand '%')
      end,
      desc = 'Watch file',
    },

    {
      '<leader>tws',
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require('neotest').watch.stop()
      end,
      desc = 'Watch file',
    },
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('neotest').setup {
      -- ...,
      adapters = {
        -- ...,
        require 'rustaceanvim.neotest',
      },
    }
  end,
}
