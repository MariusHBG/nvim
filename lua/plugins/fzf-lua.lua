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
