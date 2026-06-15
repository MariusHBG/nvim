local configure_cursor_highlight = function(event)
  -- The following two autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
      end,
    })
  end
end

local configure_keymaps = function(ev)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
  end

  -- NOTE: CTRL-s is already bound to signature-help by default!

  local fzf = require 'fzf-lua'

  map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
  map('gr', fzf.lsp_references, '[G]oto [R]eferences')
  map('gi', fzf.lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', fzf.lsp_typedefs, 'Type [D]efinition')
  map('gs', fzf.lsp_document_symbols, '[G]oto document [s]ymbols')

  map('gS', fzf.lsp_live_workspace_symbols, '[G]oto workspace [S]ymbols')

  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  map('ga', function()
    fzf.lsp_code_actions { winopts = { relative = 'cursor', row = 1.01, col = 0, height = 0.4, width = 0.4 } }
  end, '[C]ode [A]ction', { 'n', 'x' })

  -- NOTE: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map('<leader>ch', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = ev.buf })
    end, '[C]ode toggle inlay [H]ints')
  end
end

local config = function()
  local servers = { 'lua_ls', 'ts_ls' }

  require('mason').setup()
  -- This will call vim.lsp.enable internally
  require('mason-lspconfig').setup { ensure_installed = servers }

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', {}),
    callback = function(ev)
      configure_keymaps(ev)
      configure_cursor_highlight(ev)
    end,
  })

  -- Remove default keymaps starting with gr so that the custom 'gr' for 'go to references' triggers faster
  vim.keymap.del('n', 'grn')
  vim.keymap.del('n', 'gra')
  vim.keymap.del('n', 'grr')
  vim.keymap.del('n', 'gri')
  vim.keymap.del('n', 'grt')
  vim.keymap.del('n', 'gx')
end

return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    config()
  end,
}
