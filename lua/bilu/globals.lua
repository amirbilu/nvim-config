-- set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
vim.g.mapleader = ","
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.opt_local.spell = true

-- Support context-based comments. Mainly for tsx. https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	if option == "commentstring" then
		print("here", require("ts_context_commentstring.internal").calculate_commentstring())
	end
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end
