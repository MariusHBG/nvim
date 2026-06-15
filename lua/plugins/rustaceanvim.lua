return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            rustfmt = {
              overrideCommand = { 'cargo', '+nightly', 'fmt', '--all' },
            },
          },
        },
      },
    }
  end,
}
