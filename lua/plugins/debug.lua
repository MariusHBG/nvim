local function configure_dap_ui()
  local dap = require 'dap'
  local dapui = require 'dapui'
  -- Dap UI setup
  -- For more information, see |:help nvim-dap-ui|
  dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
      icons = {
        pause = '⏸',
        play = '▶',
        step_into = '⏎',
        step_over = '⏭',
        step_out = '⏮',
        step_back = 'b',
        run_last = '▶▶',
        terminate = '⏹',
        disconnect = '⏏',
      },
    },
  }

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end

  -- dap.listeners.before.event_terminated.dapui_config = function()
  --   dapui.close()
  -- end
  -- dap.listeners.before.event_exited.dapui_config = function()
  --   dapui.close()
  -- end

  -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  -- dap.listeners.before.event_exited['dapui_config'] = dapui.close
end

local function configure_dap_symbols()
  vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#ffffff', bg = 'gray' })
  vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = 'red' })
  vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = 'salmon' })
  vim.api.nvim_set_hl(0, 'DapStopped', { fg = 'white', bg = '#76788c' })

  local sign = vim.fn.sign_define

  sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
  sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
  sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = 'DapStopped', numhl = '' })
  sign('DapStopped', { text = '', texthl = 'DapBreakpoint', linehl = 'DapStopped', numhl = 'DapStopped' })
end

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = function(_, keys)
    return {
      {
        '<F5>',
        function()
          -- (Re-)reads launch.json if present
          if vim.fn.filereadable '.vscode/launch.json' then
            require('dap.ext.vscode').load_launchjs(nil, { cpptools = { 'c', 'cpp' } })
          end
          require('dap').continue()
        end,
        desc = 'Start using launch.json',
      },
      -- { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      {
        '<F11>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F10>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<S-F11>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>dp',
        function()
          require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
        end,
        desc = 'Debug: Insert log [p]oint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      {
        '<F7>',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: See last session result.',
      },
      -- { '<leader>gb', dap.run_to_cursor },
      unpack(keys),
    }
  end,
  config = function()
    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve', Disabled go as gopls failed to install and this makes startup slower
        'codelldb',
      },
    }

    configure_dap_ui()
    configure_dap_symbols()

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }
    -- dap.configurations.cpp = {
    --   {
    --     name = 'Launch file',
    --     type = 'codelldb',
    --     request = 'launch',
    --     program = function()
    --       return vim.fn.input('THIS IS A TEST: ', vim.fn.getcwd() .. '/', 'file')
    --     end,
    --     cwd = '${workspaceFolder}',
    --     stopOnEntry = false,
    --   },
    -- }
  end,
}
