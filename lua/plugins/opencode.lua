return {
  'nickjvandyke/opencode.nvim',
  branch = 'main', -- OpenCode v2 support
  version = false, -- Override Lazy's stable-version selection
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      'folke/snacks.nvim',
      optional = true,
      opts = {
        picker = {
          actions = {
            opencode_send = function(picker) ---@param picker snacks.Picker
              local items = vim.tbl_map(function(item) ---@param item snacks.picker.Item
                return item.file and require('opencode').format { path = item.file, from = item.pos, to = item.end_pos } or item.text
              end, picker:selected { fallback = true })

              -- Trailing "..." opens ask() pre-filled instead of submitting right away
              require('opencode').prompt(table.concat(items, ', ') .. ' ...')
            end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    vim.o.autoread = true -- Required for `opts.events.reload`

    vim.keymap.set({ 'n', 'x' }, '<leader>aa', function()
      require('opencode').ask '@this: '
    end, { desc = 'Ask opencode…' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ax', function()
      require('opencode').select()
    end, { desc = 'Execute opencode action…' })

    -- Trailing "..." opens ask() pre-filled instead of submitting immediately
    vim.keymap.set({ 'n', 'x' }, '<leader>asr', function()
      return require('opencode').operator '@this ...'
    end, { desc = '[A]I [s]end [r]ange to opencode', expr = true })
    -- require("opencode").operator("@this") .. "_"
    -- vim.keymap.set('n', '<leader>asl', function()
    --   return require('opencode').operator '@this ...' .. '_'
    -- end, { desc = '[A]I [s]end [l]ine to opencode', expr = true })
    vim.keymap.set('n', '<leader>asl', function()
      return require('opencode').operator '@this ...' .. '_'
    end, { desc = '[A]I [s]end [l]ine to opencode', expr = true })
  end,
}
