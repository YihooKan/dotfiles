# Neovim Configuration

A personal Neovim setup managed with [lazy.nvim][lazy].

## Requirements

- Neovim >= 0.9
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Node.js (for LSP servers installed via Mason)
- [ripgrep][ripgrep] — required for Telescope live grep

> **Note:** Telescope's live grep and grep string features depend on
> `ripgrep`. Without it, those features will silently fail.
> Install it before launching Neovim:
>
> ```bash
> # macOS
> brew install ripgrep
>
> # Ubuntu / Debian
> sudo apt install ripgrep
> ```

## Structure

```text
nvim/
├── init.lua                  # Entry point — options, diagnostics, colorscheme
├── filetype.lua              # Custom filetype detection
├── lazy-lock.json            # Plugin version lockfile
├── spell/                    # Custom spell-check word list
└── lua/
    ├── config/
    │   ├── keymaps.lua       # Global keymaps
    │   └── lazy.lua          # lazy.nvim bootstrap & setup
    └── plugins/
        ├── theme.lua         # tokyonight colorscheme
        ├── lsp.lua           # LSP (nvim-lspconfig + Mason)
        ├── formatter.lua     # Auto-format on save (conform.nvim)
        ├── linter.lua        # Linting (nvim-lint)
        ├── treesitter.lua    # Syntax highlighting
        ├── telescope.lua     # Fuzzy finder
        ├── nvim-tree.lua     # File explorer
        ├── bufferline.lua    # Buffer tab bar
        ├── lualine.lua       # Status line
        ├── gitsigns.lua      # Git hunk signs
        ├── flash.lua         # Fast motion / jump
        └── mini-surround.lua # Surround text objects
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [tokyonight.nvim][tokyonight] | Colorscheme |
| [nvim-lspconfig][lspconfig] + [mason.nvim][mason] | LSP & server installer |
| [conform.nvim][conform] | Format on save |
| [nvim-lint][nvim-lint] | Linting |
| [nvim-treesitter][treesitter] | Syntax highlighting & parsing |
| [telescope.nvim][telescope] | Fuzzy finder |
| [nvim-tree.lua][nvim-tree] | File explorer |
| [bufferline.nvim][bufferline] | Buffer tab bar |
| [lualine.nvim][lualine] | Status line |
| [flash.nvim][flash] | Fast jump / motion |
| [mini.surround][mini-surround] | Surround text objects |

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/YihooKan/dotfiles.git ~/Repos/dotfiles
```

### 2. Create a symlink

Neovim loads its configuration from `~/.config/nvim`.
Create a symlink pointing to this directory:

```bash
ln -s ~/Repos/dotfiles/nvim ~/.config/nvim
```

To verify the symlink was created correctly:

```bash
ls -la ~/.config/nvim
# Expected output:
# lrwxr-xr-x  ...  /Users/<you>/.config/nvim -> /Users/<you>/Repos/dotfiles/nvim
```

> If `~/.config/nvim` already exists, remove or back it up first:
>
> ```bash
> mv ~/.config/nvim ~/.config/nvim.bak
> ln -s ~/Repos/dotfiles/nvim ~/.config/nvim
> ```

lazy.nvim will automatically install all plugins on the first launch.

[lazy]: https://github.com/folke/lazy.nvim
[ripgrep]: https://github.com/BurntSushi/ripgrep
[tokyonight]: https://github.com/folke/tokyonight.nvim
[lspconfig]: https://github.com/neovim/nvim-lspconfig
[mason]: https://github.com/williamboman/mason.nvim
[conform]: https://github.com/stevearc/conform.nvim
[nvim-lint]: https://github.com/mfussenegger/nvim-lint
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[telescope]: https://github.com/nvim-telescope/telescope.nvim
[nvim-tree]: https://github.com/nvim-tree/nvim-tree.lua
[bufferline]: https://github.com/akinsho/bufferline.nvim
[lualine]: https://github.com/nvim-lualine/lualine.nvim
[flash]: https://github.com/folke/flash.nvim
[mini-surround]: https://github.com/echasnovski/mini.surround
