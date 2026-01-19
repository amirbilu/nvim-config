require("dap").adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = { "/home/bilu/Downloads/dap/js-debug/src/dapDebugServer.js", "${port}" },
	},
}

-- Setup a config for Node
for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to Node (port 9229)",
			port = 9229,
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			skipFiles = { "<node_internals>/**" },
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Yarn Dev",
			runtimeExecutable = "yarn",
			runtimeArgs = { "dev" }, -- what you'd normally type in the terminal
			cwd = vim.fn.getcwd(),
			console = "integratedTerminal", -- or "internalConsole"
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch mirrord",
			runtimeExecutable = "mirrord",
			runtimeArgs = {
				"exec",
				"--target",
				"deployment/tabnine-tabnine-cloud-app",
				"-f",
				".mirrord/mirrord.json",
				"--",
				"yarn",
				"dev",
			}, -- what you'd normally type in the terminal
			cwd = vim.fn.getcwd(),
			console = "integratedTerminal", -- or "internalConsole"
		},
	}
end

-- Setup codelldb adapter for Rust
local dap = require("dap")
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

-- Load .vscode/launch.json configurations
local vscode = require("dap.ext.vscode")
vscode.load_launchjs(nil, {
	["pwa-node"] = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	["codelldb"] = { "rust" },
	["lldb"] = { "rust" },
})