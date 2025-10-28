require("tabnine").setup({
	debounce_ms = 800,
	disable_auto_comment = true,
	accept_keymap = "<Tab>",
	suggestion_hl_group = "Comment",
	suggestion_color = { gui = "#808080", cterm = 244 },
	-- tabnine_enterprise_host = "https://dev.tabnine.io",
	log_file_path = "/tmp/tabnine-nvim.log",
})
