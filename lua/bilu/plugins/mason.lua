require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "tsserver", "rust_analyzer", "pyright" },
	handlers = {
		function(server_name)
			if server_name == "rust_analyzer" then
				require("lspconfig")[server_name].setup({
					cargo = {
						features = "onprem",
					},
				})
			else
				require("lspconfig")[server_name].setup({})
			end
		end,
	},
})
