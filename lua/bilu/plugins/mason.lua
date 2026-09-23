require("mason").setup({
	ui = { keymaps = { toggle_package_expand = "<C-o>" } },
})

require("mason-tool-installer").setup({
	ensure_installed = { "stylua", "prettier", "glow", "js-debug-adapter", "codelldb" },
	run_on_start = true,
	auto_update = false,
})

-- Define LSP server configurations using the new vim.lsp.config() API (Neovim 0.11+)
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				-- "all" = analyze with every feature enabled, so feature-gated
				-- code (e.g. the agent's #[cfg(feature = "ebpf")] collector) isn't
				-- grayed out. Per-crate features differ across repos, and "all"
				-- avoids "unknown feature" errors a fixed list would cause.
				features = "all",
				-- Don't rebuild proc macros on every save
				buildScripts = {
					rebuildOnSave = false,
				},
			},
			checkOnSave = {
				command = "clippy",
			},
			files = {
				watcherExclude = {
					"**/target/**",
					"**/.git/**",
					"**/node_modules/**",
				},
				-- Use server-side file watching (more efficient)
				watcher = "server",
			},
			-- Reduce reindexing triggers
			cachePriming = {
				enable = true,
				numThreads = 4,
			},
			-- Debounce file change events
			lru = {
				capacity = 256,
			},
		},
	},
})

vim.lsp.config("ts_ls", {})
vim.lsp.config("pyright", {})
vim.lsp.config("omnisharp", {})

-- Enable LSP servers
vim.lsp.enable({ "rust_analyzer", "ts_ls", "pyright", "omnisharp" })

-- :LspRestart — native vim.lsp has no restart command, so define one. Stops all
-- clients and re-attaches by reloading the current buffer once the (async) stop
-- settles, which makes servers re-read config (e.g. rust-analyzer.toml features).
vim.api.nvim_create_user_command("LspRestart", function()
	for _, c in ipairs(vim.lsp.get_clients()) do
		c:stop()
	end
	vim.defer_fn(function()
		vim.cmd("edit")
	end, 300)
end, { desc = "Restart LSP clients" })

require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "ts_ls", "rust_analyzer", "pyright", "omnisharp" },
	automatic_enable = false, -- Servers are enabled above, including system-installed ones.
})
