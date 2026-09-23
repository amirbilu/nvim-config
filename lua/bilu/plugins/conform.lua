local prettier = { "prettier" }

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = prettier,
		javascriptreact = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		vue = prettier,
		css = prettier,
		scss = prettier,
		less = prettier,
		html = prettier,
		json = prettier,
		json5 = prettier,
		jsonc = prettier,
		yaml = prettier,
		markdown = prettier,
		["markdown.mdx"] = prettier,
		graphql = prettier,
		handlebars = prettier,
		svelte = prettier,
		astro = prettier,
		htmlangular = prettier,
	},
	format_on_save = { timeout_ms = 1500, lsp_format = "fallback" },
})
