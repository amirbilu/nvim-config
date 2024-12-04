local M = require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	use("folke/tokyonight.nvim")
	use("tpope/vim-fugitive")

	-- lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" }, -- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" }, -- Snippets
			{ "f3fora/cmp-spell" }, -- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- 	use({
	-- 		"windwp/nvim-autopairs",
	-- 		config = function()
	-- 			require("nvim-autopairs").setup({})
	-- 		end,
	-- 	})

	use("simrat39/rust-tools.nvim")

	use("hashivim/vim-terraform")

	use({ "~/Workspace/tabnine-nvim", run = "./dl_binaries.sh" })

	use("nvim-telescope/telescope.nvim")

	-- treeistter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use("nvim-treesitter/nvim-treesitter-context")

	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- layout
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("nvim-lua/lsp-status.nvim")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use("mfussenegger/nvim-dap")

	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({ glow_path = "/usr/bin/glow" })
		end,
	})

	use("nvimtools/none-ls.nvim")
end)

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/bilu/plugins")) do
	require("bilu.plugins." .. file:gsub("%.lua$", ""))
end

return M
