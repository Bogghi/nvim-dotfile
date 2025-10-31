# Matteo's Neovim Configuration

## Overview

A personalized Neovim setup built on **kickstart.nvim**, enhanced with custom plugins and workflows optimized for productive development.

### Key Features

* **IDE-like Development**: Full LSP integration with intelligent code completion
* **Git Workflow**: gitsigns, diffview, and fugitive for seamless version control
* **Intelligent Editing**: treesitter-based syntax highlighting, autopairs, and smart formatting
* **Navigation & Discovery**: Telescope fuzzy finder with ripgrep integration
* **Claude Code Integration**: Direct Claude AI integration for code analysis and generation
* **Beautiful UI**: Dracula theme with custom tab bar (tabby) and file tree (neo-tree)

## Installation

### Prerequisites

Requires Neovim **latest stable** or **nightly** build.

**Dependencies:**
- `git`, `make`, `gcc`, `unzip` (build tools)
- `ripgrep` and `fd-find` (search/file finding)
- Nerd Font (for icons)
- Clipboard tool (xclip on Linux)
- Node.js, Python, Go, Rust (language runtimes)

### Quick Install

```sh
git clone https://github.com/matteoborghi/.config/nvim ~/.config/nvim
nvim
```

Lazy will auto-install all plugins on first launch. Check status with `:Lazy`.

### Setup & Configuration

Check the `lua/custom/` directory for custom plugins and settings:
- `plugins/` - Individual plugin configurations
- `keymaps.lua` - Custom key bindings
- `init.lua` - Custom initialization

Edit these files to adapt the configuration to your workflow.


## Plugin Ecosystem

### Development & LSP
- **nvim-lspconfig**: Language server configuration
- **nvim-cmp**: Completion engine with multiple sources
- **conform.nvim**: Code formatting
- **nvim-lint**: Code linting integration
- **nvim-treesitter**: Advanced syntax trees
- **nvim-autopairs**: Auto bracket/quote pairing

### Git Integration
- **gitsigns.nvim**: Inline git status and hunks
- **diffview.nvim**: Enhanced diff viewing
- **vim-fugitive**: Git commands within Vim

### Navigation & UI
- **telescope.nvim**: Fuzzy finder and picker
- **neo-tree.nvim**: File explorer with git status
- **tabby.nvim**: Custom tab bar
- **indent-blankline.nvim**: Visual indent guides

### Themes & Appearance
- **dracula** theme: Beautiful dark color scheme

### AI & Tools
- **Claude Code**: Integrated AI assistance

## Key Bindings

Review `lua/custom/keymaps.lua` for current bindings. Some highlights:
- `<Space>` - Leader key for custom commands
- `<C-f>` / `<C-b>` - Navigate search results (Telescope)
- `<C-p>` - Find files
- `<Space>f` - Format code
- `<Space>ca` - Code actions (LSP)

## Customization

This configuration is designed to be extended. Key areas to modify:

1. **Plugin Configuration**: `lua/custom/plugins/` - Add or modify plugin configs
2. **Key Bindings**: `lua/custom/keymaps.lua` - Custom key mappings
3. **LSP Setup**: `lua/custom/plugins/lsp.lua` - Configure language servers
4. **Theme**: Edit color scheme in `lua/custom/plugins/dracula.lua`

## Resources

- [Neovim Docs](https://neovim.io/doc/user/)
- [Lazy.nvim](https://lazy.folke.io/) - Plugin manager
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Base config

## License

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

