-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },

	{ "folke/tokyonight.nvim" },
	{ "tpope/vim-fugitive" },

	-- lsp (using native Neovim 0.11+ APIs)
	{ "neovim/nvim-lspconfig" }, -- Still useful for server configurations
	{ "mason-org/mason.nvim" },
	{ "mason-org/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", dependencies = { "mason-org/mason.nvim" } },

	-- Completion and snippets
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"ribru17/blink-cmp-spell",
		},
	},

	{ "hashivim/vim-terraform" },

	{
		"coder/claudecode.nvim",
		config = true,
	},
	{
		"nwiizo/codex.nvim",
		config = function()
			require("codex").setup({
				selection = { keymaps = { ask = false, edit = false } },
			})
		end,
	},

	{ "folke/snacks.nvim", priority = 1000, lazy = false },

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup()
			local ensure_installed = { "typescript", "javascript", "rust", "lua", "tsx" }
			local installed = treesitter.get_installed()
			local to_install = vim.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(installed, parser)
				end)
				:totable()
			if #to_install > 0 then
				treesitter.install(to_install)
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if pcall(vim.treesitter.start) then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context" },

	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- layout
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},

	{ "mfussenegger/nvim-dap" },

	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({ glow_path = vim.fn.stdpath("data") .. "/mason/bin/glow" })
		end,
	},

	{ "stevearc/conform.nvim" },

	{
		"lucidph3nx/nvim-sops",
		config = function()
			require("nvim_sops").setup({})
		end,
	},
})

-- Load plugin configurations
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/bilu/plugins")) do
	require("bilu.plugins." .. file:gsub("%.lua$", ""))
end
