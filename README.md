# nvim-config

Neovim 0.12 configuration managed with lazy.nvim. On first launch, lazy.nvim installs
the plugins, Mason installs the configured language servers and tools, and Tree-sitter
installs the configured parsers. Internet access is needed for this first run.
The included `lazy-lock.json` records the plugin versions.

Before launching on a new machine, install Neovim 0.12+, Git, Node.js/npm, and
`ripgrep`. Node.js/npm is required by the TypeScript tools and JavaScript debugger;
`ripgrep` powers text search. Install the Codex CLI and Claude Code CLI separately
to use their editor integrations, then sign in to each. Project-specific launch
commands (`yarn`, `mirrord`) and SOPS keys are also external to this config.

Conform uses Stylua for Lua, Prettier for web files, and LSP formatting as a fallback.
Mason also installs Glow, the JavaScript debug adapter, and CodeLLDB automatically.

Common mappings (leader is `,`):

| Mapping | Action |
| --- | --- |
| `<leader>p` | Find files with Snacks |
| `<leader>/` | Search text with Snacks |
| `<leader>nn` | Toggle the right-side explorer |
| `<leader>nf` | Reveal the current file in the explorer |
| `<leader>f` | Format the current buffer |
| `<C-j>` / `<C-k>` / `<C-o>` | Next / previous / open in completion, pickers, and plugin lists |
| `<leader>cc` | Focus Codex |
| `<leader>cf` | Add current file to Codex |
| `<leader>cs` (visual) | Send selection to Codex |
