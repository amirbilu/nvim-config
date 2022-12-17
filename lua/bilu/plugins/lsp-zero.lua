local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({ set_lsp_keymaps = false })
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
