return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,
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
  end,

	-- stylua: ignore
  keys = {
		-- Word
    { '<leader>sw', function() require('fzf-lua').grep { search = vim.fn.input 'Grep > ' } end, desc = '[S]earch [W]ord', },
		-- Marks
    { '<leader>sm', function() require('fzf-lua').marks() end, desc = '[s]earch [m]arks' },
		-- Helptags
    { '<leader>sh', function() require('fzf-lua').helptags() end, desc = '[s]earch [h]elptags' },
		-- Autocommands
    { '<leader>sa', function() require('fzf-lua').autocmds() end, desc = '[S]each [a]utocommands' },
		-- Git buffer commits
    { '<leader>gc', mode = { 'n', 'v' }, function() require('fzf-lua').git_bcommits() end, desc = '[g]it [c]ommits for buffer' },
		-- Git project commits
    { '<leader>gC', function() require('fzf-lua').git_commits() end, desc = '[g]it [c]ommits for project' },
		-- Git hunks
    { '<leader>gh', function() require('fzf-lua').git_hunks() end, desc = '[g]it [h]unks' },
		-- Git status
    { '<leader>gs', function() require('fzf-lua').git_status() end, desc = '[g]it [s]tatus' },
		-- Git files
    { '<leader>gf', function() require('fzf-lua').git_files() end, desc = '[g]it [f]iles' },
		-- Git diff against remote
    { '<leader>gdr', function() require('fzf-lua').git_diff() end, desc = '[g]it [d]iff against [r]emote' },
		-- Git diff against main
    { '<leader>gdm', function() require('fzf-lua').git_diff({ cmd = "git diff origin/main...HEAD", }) end, desc = '[g]it [d]iff against [m]ain ' },
		-- Git diff against master
    { '<leader>gda', function() require('fzf-lua').git_diff({ cmd = "git diff origin/master...HEAD", }) end, desc = '[g]it [d]iff against m[a]ster' },
		-- Git blame
    { '<leader>gb', mode = { 'n', 'v' }, function() require('fzf-lua').git_blame() end, desc = '[g]it [b]lame' },
		-- Spell suggestions
    { '<leader>sj', function() require('fzf-lua').spell_suggest { winopts = { relative = 'cursor', row = 1.01, col = 0, height = 0.2, width = 0.2 } } end, desc = 'Spell suggestions' },
		-- Registers
    { '<leader>s"', function() require('fzf-lua').registers() end, desc = 'Search [r]egisters' },
		-- Word under cursor
    { '<leader>sc', function() require('fzf-lua').grep_cword() end, desc = '[S]earch word under [c]ursor' },
		-- Current buffer
    { '<leader>/', function() require('fzf-lua').grep_curbuf() end, desc = 'Fuzzy search in current buffer' },
		-- Project files
    { '<leader>sp', function() require('fzf-lua').files() end, desc = '[S]earch [P]roject files' },
		-- Keymaps
    { '<leader>sk', function() require('fzf-lua').keymaps() end, desc = '[S]earch [K]eymaps' },
		-- Open picker selection
    { '<leader>st', function() require('fzf-lua').builtin() end, desc = '[S]earch [S]elect fzf-lua' },
		-- Live grep
    { '<leader>sl', function() require('fzf-lua').live_grep() end, desc = '[S]earch by grep' },
		-- Workspace diagnostics
    { '<leader>sd', function() require('fzf-lua').diagnostics_workspace() end, desc = '[S]earch [D]iagnostics' },

		-- Resume last search
    { '<leader>sr', function() require('fzf-lua').resume() end, desc = '[S]earch [R]esume' },
		-- Old files
    { '<leader>so', function() require('fzf-lua').oldfiles() end, desc = '[S]earch Recent Files ("." for repeat)' },
		-- Open buffers
    { '<leader><leader>', function() require('fzf-lua').buffers() end, desc = '[ ] Find existing buffers' },
  },
}
