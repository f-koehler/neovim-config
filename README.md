# Neovim Configuration

A modern, feature-rich Neovim configuration built with [Lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager. This configuration focuses on providing a fast, efficient development environment with excellent LSP support, fuzzy finding, and syntax highlighting.

## Features

- 🚀 Fast startup with lazy loading
- 📦 Plugin management with Lazy.nvim
- 🎨 Beautiful UI with Catppuccin theme
- 🔍 Fuzzy finding with Telescope
- 📝 Advanced completion with Blink.cmp
- 🤖 GitHub Copilot integration
- 🌳 Syntax highlighting with Tree-sitter
- 🔧 LSP support with nvim-lspconfig
- 🚨 Error diagnostics with Trouble.nvim
- ⌨️ Key mapping discovery with Which-key
- 🎨 Code formatting with Conform.nvim
- 🔀 Git integration with Gitsigns.nvim
- 📝 TODO comment highlighting with Todo-comments
- 🚀 Task runner with Overseer.nvim
- 🌙 Enhanced Lua development with Lazydev.nvim

## System Dependencies

### Required Dependencies

Before using this configuration, ensure you have the following system dependencies installed:

- **Neovim** (>= 0.11.0)
- **Git** - For plugin management
- **Node.js** - Required for some LSP servers and plugins
- **Ripgrep** (`rg`) - Fast search tool used by Telescope
- **fd** - Fast file finder used by Telescope
- **Cargo/Rust** - Required for building Blink.cmp

### Optional Dependencies

- **A Nerd Font** - For proper icon display (I am using `CaskaydiaCove Nerd Font`)
- **Language servers** - Install LSP servers for your preferred languages

### Nix Shell Environment

This configuration includes a `shell.nix` file for Nix users that provides all necessary dependencies:

```bash
nix-shell
```

The Nix shell includes:
- `cargo` - Rust toolchain
- `stylua` - Lua formatter (used by Conform.nvim)
- `lua-language-server` - Lua LSP
- `fd` - File finder
- `ripgrep` - Text search
- `pre-commit` - Git hooks
- `selene` - Lua linter
- `luacheck` - Lua static analyzer
- `nodejs` - JavaScript runtime

## Installation

1. **Backup your existing Neovim configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository:**
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Install system dependencies** (see section above)

4. **Start Neovim:**
   ```bash
   nvim
   ```

5. **Install plugins:**
   Lazy.nvim will automatically install all plugins on first startup.

## Plugins

### Plugin Manager
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager with lazy loading

### UI & Theming
- **[catppuccin](https://github.com/catppuccin/nvim)** - Soothing pastel colorscheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Fast and configurable statusline
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration with signs, hunks, and blame

### Completion & LSP
- **[blink.cmp](https://github.com/saghen/blink.cmp)** - Fast completion engine written in Rust
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration helpers
- **[copilot.vim](https://github.com/github/copilot.vim)** - GitHub Copilot integration
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Enhanced Lua development with better LSP support

### Code Quality & Formatting
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Async code formatting with format-on-save
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - Highlight and search TODO comments with custom icons

### Navigation & Search
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder and picker
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Utility library (Telescope dependency)

### Syntax & Parsing
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and parsing

### Utilities
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Key binding hints and discovery
- **[trouble.nvim](https://github.com/folke/trouble.nvim)** - Pretty diagnostics and quickfix list
- **[overseer.nvim](https://github.com/stevearc/overseer.nvim)** - Task runner for build systems and scripts

## Key Mappings

### Leader Key
- **Leader:** `<Space>`
- **Local Leader:** `\`

### LSP Mappings
- `<leader>la` - Code actions
- `<leader>lr` - Rename symbol
- `<leader>gD` - Go to declaration
- `<leader>gd` - Go to definition
- `<leader>gr` - Find references

### Telescope (configured via Which-key)
- Access Telescope commands through `<leader>` + key combinations
- Which-key will show available options when you press `<leader>`

## Configuration Structure

```
nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── config/             # Core configurations
│   │   ├── lazy.lua        # Lazy.nvim setup
│   │   └── lsp.lua         # LSP key mappings
│   └── plugins/            # Plugin specifications & configurations
│       ├── blink.lua       # Completion configuration
│       ├── catppuccin.lua  # Theme configuration & setup
│       ├── conform.lua     # Code formatting setup
│       ├── copilot.lua     # GitHub Copilot setup
│       ├── gitsigns.lua    # Git integration configuration
│       ├── lazydev.lua     # Lua development enhancement
│       ├── lspconfig.lua   # LSP server configuration
│       ├── lualine.lua     # Statusline configuration & setup
│       ├── overseer.lua    # Task runner configuration
│       ├── telescope.lua   # Telescope configuration & setup
│       ├── todo-comments.lua # TODO comment highlighting
│       ├── treesitter.lua  # Syntax highlighting setup
│       ├── trouble.lua     # Diagnostics configuration
│       └── which-key.lua   # Key mapping helper
└── shell.nix               # Nix development environment
```

## Language Support

### Currently Configured
- **Lua** - Full LSP support with lua-language-server, stylua formatting, and enhanced development features via lazydev.nvim

### Formatting Support (via Conform.nvim)
The configuration includes formatters for multiple languages:
- **Lua** - stylua
- **Python** - ruff
- **JavaScript/TypeScript** - prettier
- **JSON/HTML/CSS/SCSS/YAML** - prettier
- **TOML** - taplo

Note: You'll need to install the respective formatters for the languages you use.

### Adding New Languages
1. Install the appropriate language server
2. Add the server to `lua/plugins/lspconfig.lua` in the `servers` table
3. Restart Neovim

Example for adding Python support:
```lua
servers = {
    lua_ls = {},
    pyright = {},  -- Add this line
},
```

## Development Tools

This configuration includes several development and quality assurance tools:

- **Pre-commit hooks** - Configured in `.pre-commit-config.yaml`
- **Renovate** - Automated dependency updates via `renovate.json`
- **Selene** - Lua linting with `selene.toml` and `selene-vim.yml`
- **EditorConfig** - Consistent coding style with `.editorconfig`

## Updating

### Update Plugins
Run `:Lazy update` in Neovim to update all plugins.

### Update Language Servers
Language servers are managed separately. Update them using your system's package manager or the language server's specific update mechanism.

## Troubleshooting

### Plugin Issues
- Run `:Lazy health` to check plugin status
- Run `:checkhealth` to diagnose Neovim configuration issues

### LSP Issues
- Run `:LspInfo` to see active language servers
- Check that language servers are installed and in your PATH

### Telescope Issues
- Ensure `ripgrep` and `fd` are installed and accessible
- Run `:Telescope diagnostics` to check for configuration issues

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
