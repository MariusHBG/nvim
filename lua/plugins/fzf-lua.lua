return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup {
      defaults = {
        -- true by default, but list here if I want to disable
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },
      -- keymap = {
      --   builtin = {
      --     ['<C-d>'] = 'preview-page-down',
      --     ['<C-u>'] = 'preview-page-up',
      --     ['<C-p'] = 'preview-up',
      --     ['<C-n'] = 'preview-down',
      --   },
      --   -- fzf = {
      --   --   ['<C-d>'] = 'preview-page-down',
      --   --   ['<C-u>'] = 'preview-page-up',
      --   --   ['<C-p'] = 'preview-up',
      --   --   ['<C-n'] = 'preview-down',
      --   -- },
      -- },
      keymap = {
        -- Below are the default binds, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          -- true,        -- uncomment to inherit all the below in your custom config
          ['<M-Esc>'] = 'hide', -- hide fzf-lua, `:FzfLua resume` to continue
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          -- Rotate preview clockwise/counter-clockwise
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          -- `ts-ctx` binds require `nvim-treesitter-context`
          ['<F7>'] = 'toggle-preview-ts-ctx',
          ['<F8>'] = 'preview-ts-ctx-dec',
          ['<F9>'] = 'preview-ts-ctx-inc',
          ['<S-Left>'] = 'preview-reset',
          -- ['<S-down>'] = 'preview-page-down',
          -- ['<S-up>'] = 'preview-page-up',
          ['<M-S-down>'] = 'preview-down',
          ['<M-S-up>'] = 'preview-up',
          ['<C-d>'] = 'preview-half-page-down',
          ['<C-u>'] = 'preview-half-page-up',
          ['<C-p>'] = 'preview-up',
          ['<C-n>'] = 'preview-down',
        },
        fzf = {
          -- fzf '--bind=' options
          -- true,        -- uncomment to inherit all the below in your custom config
          ['ctrl-z'] = 'abort',
          -- ['ctrl-u'] = 'unix-line-discard',
          ['ctrl-f'] = 'half-page-down',
          ['ctrl-b'] = 'half-page-up',
          ['ctrl-a'] = 'beginning-of-line',
          ['ctrl-e'] = 'end-of-line',
          ['alt-a'] = 'toggle-all',
          ['alt-g'] = 'first',
          ['alt-G'] = 'last',
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ['f3'] = 'toggle-preview-wrap',
          ['f4'] = 'toggle-preview',
          ['ctrl-d'] = 'preview-half-page-down',
          ['ctrl-u'] = 'preview-half-page-up',
          ['ctrl-p'] = 'preview-up',
          ['ctrl-n'] = 'preview-down',
        },
      },
    }

    local fzf = require 'fzf-lua'

    vim.keymap.set('n', '<leader>sw', function()
      fzf.grep { search = vim.fn.input 'Grep > ' }
    end, { desc = '[S]earch [W]ord' })
    vim.keymap.set('n', '<leader>sp', fzf.files, { desc = '[S]earch [P]roject files' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>st', fzf.builtin, { desc = '[S]earch [S]elect fzf-lua' })
    vim.keymap.set('n', '<leader>sl', fzf.live_grep, { desc = '[S]earch by grep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s,', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>r', fzf.registers, { desc = 'Search [r]egisters' })
    vim.keymap.set('n', '<leader>sm', fzf.marks, { desc = '[s]earch [m]arks' })
    vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = '[s]earch [h]elptags' })
    vim.keymap.set('n', '<leader>gc', fzf.git_bcommits, { desc = '[g]it [c]ommits' })
    vim.keymap.set('n', '<leader>gs', fzf.git_status, { desc = '[g]it [s]tatus' })
    vim.keymap.set('n', '<leader>gf', fzf.git_files, { desc = '[g]it [f]iles' })
    vim.keymap.set('n', '<leader>gd', fzf.git_diff, { desc = '[g]it [d]iff' })
    vim.keymap.set('n', '<leader>gb', fzf.git_blame, { desc = '[g]it [b]lame' })

    vim.keymap.set('n', '<leader>sj', function()
      require('fzf-lua').spell_suggest { winopts = { relative = 'cursor', row = 1.01, col = 0, height = 0.2, width = 0.2 } }
    end, { desc = 'Spell suggestions' })
  end,
}
