local lsp_zero = require('lsp-zero')
-- lsp.preset("recommended")
-- lsp.set_preferences({ set_lsp_keymaps = false })

-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
-- 	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
-- 	["<C-o>"] = cmp.mapping.confirm({ select = true }),
-- 	["<C-Space>"] = cmp.mapping.complete(),
-- })

-- -- disable completion with tab, this collides with Tabnine
-- cmp_mappings["<Tab>"] = nil
-- cmp_mappings["<S-Tab>"] = nil

-- lsp.setup_nvim_cmp({ mapping = cmp_mappings })

-- -- Rust tools
-- lsp.skip_server_setup({ "rust_analyzer" })
-- local rust_lsp = lsp.build_options("rust_analyzer", { cargo = { features = { "onprem" } } })
-- require("rust-tools").setup({ server = rust_lsp })

-- lsp.setup()


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
vim.diagnostic.config({ virtual_text = true })
