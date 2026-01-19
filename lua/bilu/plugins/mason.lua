require("mason").setup({})

-- Define LSP server configurations using the new vim.lsp.config() API (Neovim 0.11+)
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = { "onprem" },
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

-- Start LSP servers immediately on VimEnter for early indexing
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local cwd = vim.fn.getcwd()

		-- Map of root markers to LSP servers
		local server_markers = {
			rust_analyzer = { "Cargo.toml" },
			ts_ls = { "package.json", "tsconfig.json", "jsconfig.json" },
			pyright = { "pyrightconfig.json", "pyproject.toml", "setup.py", "requirements.txt" },
			omnisharp = { "*.sln", "*.csproj" },
		}

		vim.defer_fn(function()
			for server, markers in pairs(server_markers) do
				for _, marker in ipairs(markers) do
					local found = vim.fn.glob(cwd .. "/" .. marker)
					if found ~= "" then
						-- Trigger LSP start by opening a relevant file or using LspStart
						vim.cmd("LspStart " .. server)
						break
					end
				end
			end
		end, 0)
	end,
})

require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "ts_ls", "rust_analyzer", "pyright", "omnisharp" },
	-- No handlers needed - servers are configured above with vim.lsp.config()
})
