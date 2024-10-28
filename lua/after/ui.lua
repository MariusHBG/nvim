local symbols = { Error = '󰅙', Info = '󰋼', Hint = '󰌵', Warn = '' }

for name, icon in pairs(symbols) do
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
  local underline_hl = 'DiagnosticUnderline' .. name
  vim.api.nvim_set_hl(0, underline_hl, { underline = true })
end
