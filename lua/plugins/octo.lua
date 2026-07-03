return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  opts = {
    picker = 'fzf-lua',
    -- bare Octo command opens picker of commands
    enable_builtin = true,
    use_local_fs = false,
    mappings = {
      review_diff = {
        toggle_viewed = { lhs = '<localleader>T', desc = 'toggle viewer viewed state' },
      },
    },
  },
  keys = {
    {
      '<leader>op',
      '<CMD>Octo pr list<CR>',
      desc = 'List GitHub PullRequests',
    },
    {
      '<leader>ofd',
      function()
        require('octo').setup { use_local_fs = false }
      end,
      desc = 'Disable local file system',
    },
    {
      '<leader>ofe',
      function()
        require('octo').setup { use_local_fs = true }
      end,
      desc = 'Enable local file system',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
    -- OR "ibhagwan/fzf-lua",
    -- OR "folke/snacks.nvim",
    'nvim-tree/nvim-web-devicons', -- optional if file_panel.icons is a function
  },
}
