# Neovim Configuration

A modern Neovim configuration built with the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager. It focuses on a fast startup, solid LSP and completion, fuzzy finding, and a good out-of-the-box experience for everyday development.

## Features

- Lazy-loaded plugin management with lazy.nvim
- Catppuccin colorscheme and lualine statusline
- Fuzzy finding and file browsing with Telescope
- Completion via blink.cmp (Rust-based)
- LSP configuration via nvim-lspconfig
- Tree-sitter syntax highlighting and parsing
- Format-on-save with conform.nvim
- Git integration with gitsigns.nvim
- Diagnostics UI with trouble.nvim
- Keymap discovery with which-key
- TODO comment highlighting
- Task running with overseer.nvim
- Enhanced Lua development with lazydev.nvim
- GitHub Copilot integration
- VSCode-compatible: only core options load when running inside the VSCode Neovim extension

## Requirements

### Required

- Neovim >= 0.11.0
- Git
- Node.js (for Copilot and several Mason-installed tools)
- Ripgrep (`rg`) — Telescope live grep
- fd — Telescope file finding
- A Rust toolchain (`cargo`) — needed to build blink.cmp
- `unzip` and `curl` — used by Mason to install language servers/formatters

### Optional

- A Nerd Font (this config is developed with `CaskaydiaCove Nerd Font`)
- Python 3 (with `pip`) — only needed if a Mason package you use installs via pip

## Installation

1. Back up any existing configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```
2. Clone this repository:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```
3. Install the system dependencies above.
4. Launch Neovim — lazy.nvim will bootstrap itself and install all plugins on first start.
   ```bash
   nvim
   ```

## Nix users

Two entry points are provided:

- `shell.nix` — a quick `nix-shell` with the development tools used by this config (cargo, stylua, lua-language-server, fd, ripgrep, pre-commit, selene, luacheck, nodejs).
- `flake.nix` — a flake exposing a dev shell, a formatter, pre-commit checks (deadnix, flake-checker, nil, nixfmt-rfc-style, statix, selene, stylua), and a `default` package built from `default.nix`.

```bash
nix-shell           # legacy shell
nix develop         # flake dev shell
nix build           # build the packaged config
```

## Layout

```
nvim/
├── init.lua                       # entry point (skips plugin setup under VSCode)
├── lazy-lock.json                 # plugin version lock file
├── flake.nix / shell.nix          # Nix dev environment
├── default.nix                    # packaged Neovim config
├── lua/
│   ├── config/
│   │   ├── global.lua             # core vim options and leader keys
│   │   ├── lazy.lua               # lazy.nvim bootstrap and setup
│   │   └── lsp.lua                # built-in LSP keymaps
│   └── plugins/                   # one file per plugin spec
│       ├── blink.lua
│       ├── catppuccin.lua
│       ├── conform.lua
│       ├── copilot.lua
│       ├── gitsigns.lua
│       ├── lazydev.lua
│       ├── lspconfig.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── overseer.lua
│       ├── telescope.lua
│       ├── telescope-file-browser.lua
│       ├── todo-comments.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       └── which-key.lua
└── selene.toml / selene-vim.yml   # Lua linting config
```

## Plugins

### Plugin manager
- [lazy.nvim](https://github.com/folke/lazy.nvim)

### UI
- [catppuccin/nvim](https://github.com/catppuccin/nvim) — colorscheme (`catppuccin-mocha`)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

### Completion and LSP
- [blink.cmp](https://github.com/saghen/blink.cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [copilot.vim](https://github.com/github/copilot.vim)
- [lazydev.nvim](https://github.com/folke/lazydev.nvim)
- [mason.nvim](https://github.com/mason-org/mason.nvim) + [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) — installs and enables configured LSP servers

### Editing and quality
- [conform.nvim](https://github.com/stevearc/conform.nvim) — formatting with format-on-save
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) — installs the formatters conform.nvim uses
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

### Navigation
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) — replaces netrw
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### Syntax
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### Workflow
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [overseer.nvim](https://github.com/stevearc/overseer.nvim)

## Keymaps

Leader is `<Space>`, local leader is `\`.

### LSP (`lua/config/lsp.lua`)
- `<leader>la` — code action
- `<leader>lr` — rename symbol
- `<leader>gD` — go to declaration
- `<leader>gd` — go to definition
- `<leader>gr` — find references

### Telescope
- `<leader>ff` — find files
- `<leader>fg` — live grep
- `<leader>fb` — buffers
- `<leader>fe` — file browser
- `<leader>fc` — file browser scoped to the current buffer's directory
- `-` — file browser in the current buffer's directory (vim-vinegar style)

### Which-key
- `<leader>?` — show buffer-local keymaps

Press `<leader>` and wait for which-key to surface the rest.

## Language support

External tools (LSP servers, formatters) are managed by [mason.nvim](https://github.com/mason-org/mason.nvim) instead of your system package manager. `mason-lspconfig.nvim` installs the LSP servers listed below and enables them via `vim.lsp.enable`; `mason-tool-installer.nvim` installs the formatters used by conform.nvim. Both run automatically on startup (`ensure_installed`), so a fresh checkout installs everything it needs the first time you launch Neovim — no manual install step. Use `:Mason` to inspect/update tools by hand.

### LSP servers configured (`lua/plugins/lspconfig.lua`)
- `ansiblels`
- `lua_ls`
- `clangd`
- `qmlls`
- `ruff`
- `rust_analyzer`

### Formatters configured (`lua/plugins/conform.lua`)
- Lua — `stylua`
- Python — `ruff`
- C/C++ — `clang-format`
- JavaScript / TypeScript — `prettier`
- JSON / HTML / CSS / SCSS / YAML — `prettier`
- TOML — `taplo`

Format-on-save is enabled with a 500ms timeout and falls back to LSP formatting.

### Adding a language server

Add it to the `servers` table in `lua/plugins/lspconfig.lua`, for example:

```lua
local servers = {
    pyright = {},
    -- ...
}
```

It's picked up automatically by both `vim.lsp.config`/`vim.lsp.enable` and Mason's `ensure_installed` list. If the server isn't in the [Mason registry](https://mason-registry.dev/registry/list), install it manually and make sure it's on `PATH`.

## Editor options

Set in `lua/config/global.lua`:

- 4-space indentation, expand tabs, smart indent
- `number` + `relativenumber`, cursorline, sign column always on
- `termguicolors` enabled
- Case-insensitive search with smart case
- 8-line scroll-off, `updatetime=250`, `timeoutlen=500`

## Development tools

- Pre-commit hooks via `.pre-commit-config.yaml` (also wired through the flake)
- Renovate config in `renovate.json`
- Lua linting via Selene (`selene.toml`, `selene-vim.yml`)
- EditorConfig for cross-editor consistency

## Updating

- Plugins: `:Lazy update` (the auto-updater is disabled — updates run via CI)
- Mason-managed tools: `:Mason` (interactive UI) or `:MasonToolsUpdate`
- Health checks: `:checkhealth`, `:Lazy health`, `:LspInfo`, `:checkhealth mason`

## Troubleshooting

- Missing icons → install a Nerd Font and configure your terminal
- Telescope errors → confirm `rg` and `fd` are on `PATH`
- LSP not attaching → check `:LspInfo` and `:Mason` to confirm the server installed successfully
- A Mason install fails → `:checkhealth mason` to check for missing prerequisites (e.g. `npm`, `python3`, `cargo`)
- Plugin failures → `:Lazy` to inspect, `:Lazy sync` to reconcile

## License

MIT — see [LICENSE](LICENSE).
