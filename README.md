# nvim-config

Personal Neovim configuration. I am just starting with this so these are pretty basic plugins and I
am planning on updating it as I learn more about Neovim.

Managed with WSL2 (Ubuntu 24.04) and Windows Terminal.

## Stack

- Plugin manager: lazy.nvim
- LSP: nvim-lspconfig + mason.nvim + mason-lspconfig.nvim
- Completion: nvim-cmp
- Fuzzy finder: telescope.nvim
- File explorer: nvim-tree.nvim
- Syntax highlighting: nvim-treesitter
- LSP UI: lspsaga.nvim
- Theme: gruvbox

## Supported languages

Python, Java, TypeScript, Go, C/C++, HTML, CSS, Lua, Bash

## Installation

Clone this repo into your Neovim config directory:

    git clone https://github.com/awesomelena/nvim-config.git ~/.config/nvim
    nvim

lazy.nvim will automatically install all plugins on first launch.

### Prerequisites

- Neovim 0.11+
- Node.js + npm
- Python 3 + pip
- Go
- git, make, cmake, build-essential

## Structure

    lua/
    ├── config/     -- options, keymaps, autocmds
    ├── plugins/    -- one file per plugin
    └── util/       -- helper modules (keymapper, lsp helpers)

## License

[MIT](LICENSE)
