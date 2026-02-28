return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        transparent = true,
        ---@diagnostic disable-next-line: unused-local
        on_colors = function(colors)
          -- Not sure if this would affect more occurances of comments
          -- colors.comment = '#7F849C'
        end,
        on_highlights = function(hl)
          hl.Comment = { fg = '#7F849C', italic = true }
          hl['@comment'] = { fg = '#7F849C', italic = true }
        end,
      }
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
