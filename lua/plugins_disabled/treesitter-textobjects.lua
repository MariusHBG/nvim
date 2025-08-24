---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['a='] = { query = '@assignment.outer', desc = 'Select outer part of assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'Select inner part of assignment' },
            ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of assignment' },
            ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of assignment' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of parameter/argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of parameter/argument' },
            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of conditional' },
            ['al'] = { query = '@loop.outer', desc = 'Select outer part of loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of loop' },
            ['af'] = { query = '@call.outer', desc = 'Select outer part of function call' },
            ['if'] = { query = '@call.inner', desc = 'Select inner part of function call' },
            ['am'] = { query = '@function.outer', desc = 'Select outer part of function definition' },
            ['im'] = { query = '@function.inner', desc = 'Select inner part of function definition' },
            ['ac'] = { query = '@class.outer', desc = 'Select outer part of class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of class' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>na'] = '@parameter.inner',
            ['<leader>nm'] = '@function.outer',
          },
          swap_previous = {
            ['<leader>pa'] = '@parameter.inner',
            ['<leader>pm'] = '@function.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- add movements to jump list
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = 'Next function call start' },
            [']m'] = { query = '@function.outer', desc = 'Next function/method def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = 'Next function call end' },
            [']M'] = { query = '@function.outer', desc = 'Next function/method def end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = 'Previous function call start' },
            ['[m'] = { query = '@function.outer', desc = 'Previous function/method def start' },
            ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Previous conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Previous loop start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = 'Previous function call end' },
            ['[M'] = { query = '@function.outer', desc = 'Previous function/method def end' },
            ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Previous conditional end' },
            ['[L'] = { query = '@loop.outer', desc = 'Previous loop end' },
          },
        },
      },
    }
    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
