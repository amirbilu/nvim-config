-- lsp-status plugin is deprecated - Neovim 0.10+ has native LSP progress
-- See :help lsp-handler for native progress handling
-- The plugin uses deprecated vim.lsp.buf_get_clients()

-- If you still need lsp-status functionality, uncomment below:
-- local lsp_status = require("lsp-status")
-- lsp_status.register_progress()

-- Native LSP progress is available via vim.lsp.status()
