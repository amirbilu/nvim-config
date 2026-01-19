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
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "f3fora/cmp-spell" },
		},
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	{ "hashivim/vim-terraform" },

	{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },

	{
		dir = "~/Workspace/tabnine-cli.nvim",
		config = function()
			require("tabnine-cli").setup()
		end,
	},

	{ "nvim-telescope/telescope.nvim" },

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{ "nvim-treesitter/nvim-treesitter-context" },

	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- layout
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	{ "nvim-lua/lsp-status.nvim" },

	{
		"nvim-tree/nvim-tree.lua",
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
			require("glow").setup({ glow_path = "/usr/bin/glow" })
		end,
	},

	{ "nvimtools/none-ls.nvim" },

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
