# Zsh Configuration

Complete Zsh configuration with Powerlevel10k theme, essential plugins,
and custom aliases.

## Features

- 🎨 **Powerlevel10k Theme** - Beautiful and fast Zsh prompt with
  instant prompt support
- 🔌 **Plugin Management** - Essential Oh My Zsh plugins pre-configured
- 📁 **Modular Structure** - Organized in pre/basic/post/local configuration files
- ⚡ **Performance Optimized** - Fast shell startup with lazy loading
- 🛠️ **Useful Aliases** - Common shortcuts for Git, navigation, and editing

## Directory Structure

```text
zsh/
├── basic.zsh          # Core Zsh settings, theme, and plugins
├── pre.d/             # Pre-initialization scripts (loaded first)
│   └── 00_p10k.zsh    # Powerlevel10k instant prompt
├── post.d/            # Post-initialization scripts (loaded after OMZ)
│   ├── alias.zsh      # Common aliases and custom functions
│   └── p10k_post.zsh  # P10k theme loading
└── local.d/           # Local machine-specific configurations
    └── local.zsh      # Personal aliases (git-ignored)
```

## Included Plugins

- **git** - Git integration and aliases
- **zsh-autosuggestions** - Fish-like autosuggestions based on history
- **zsh-syntax-highlighting** - Command syntax highlighting in real-time
- **vi-mode** - Vi keybindings for command-line editing
- **extract** - Universal archive extraction with `x` command
- **sudo** - Press ESC twice to prefix current command with sudo

## Key Aliases & Functions

### Navigation & Editing

- `vim` → `nvim` - Use Neovim as default editor
- `zshconfig` - Edit .zshrc with Neovim
- `vimconfig` - Edit Neovim config
- `cls` - Clear terminal
- `..` - Go up one directory
- `...` - Go up two directories

### Git Commands

- `gtree` - Display Git log in one-line format
- `showstash` - List all stashed changes
- `gcp` - Clean up local branches deleted on remote

### Custom Functions

**`gcp` (Git Clean Pruned)** - Automatically removes local branches whose
remote counterparts have been deleted. Features validation, clear feedback,
and safe deletion of outdated branches.

## Installation

### Prerequisites

Before setting up these dotfiles, ensure you have the following installed:

1. **Install Oh My Zsh:**

   ```bash
   sh -c "$(curl -fsSL \
     https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. **Install Powerlevel10k theme:**

   ```bash
   git clone --depth=1 \
     https://github.com/romkatv/powerlevel10k.git \
     ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
   ```

3. **Install required plugins:**

   ```bash
   # zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-autosuggestions \
     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

   # zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```

### Setup

1. **Backup or remove your existing `.zshrc`:**

   ```bash
    # Option 1: Backup your current configuration
    mv ~/.zshrc ~/.zshrc.backup

    # Option 2: Remove if you don't need to keep it
   rm ~/.zshrc
   ```

2. **Clone this repository:**

   ```bash
   git clone https://github.com/YihooKan/dotfiles.git ~/dotfiles
   ```

3. **Create a symbolic link to the `.zshrc` from this repo:**

   ```bash
   ln -s ~/dotfiles/.zshrc ~/.zshrc
   ```

4. **Apply the configuration:**

   ```bash
   source ~/.zshrc
   ```

5. **Configure Powerlevel10k theme (first time only):**

   ```bash
   p10k configure
   ```

The configuration wizard will guide you through customizing your prompt
appearance.

## Customization

### Theme Customization

Re-run the Powerlevel10k configuration wizard anytime:

```bash
p10k configure
```

### Adding Local Aliases

Edit `local.d/local.zsh` for machine-specific configurations that you don't
want to commit:

```bash
nvim ~/dotfiles/zsh/local.d/local.zsh
```

### Extending Aliases

Add your custom aliases to `post.d/alias.zsh` or create new files in
`post.d/`.

### Plugin Management

Modify the `plugins` array in `basic.zsh` to add or remove Oh My Zsh
plugins.

## Requirements

- **OS**: macOS (Zsh is the default shell since Catalina)
- **Shell**: Zsh 5.0+
- **Font**: A [Nerd Font](https://www.nerdfonts.com/) for Powerlevel10k icons
- **Editor**: Neovim (for editor-related aliases)
- **Terminal**: Any terminal with true color support

## Troubleshooting

**Slow shell startup?**

- Check if instant prompt is enabled in `pre.d/00_p10k.zsh`
- Reduce number of plugins in `basic.zsh`

**Plugins not working?**

- Verify plugins are installed in `~/.oh-my-zsh/custom/plugins/`
- Check plugin names in `basic.zsh` match installation directory names

**Icons not displaying?**

- Install a Nerd Font and configure your terminal to use it
- Run `p10k configure` to regenerate configuration

**Symbolic link not working?**

- Ensure the link was created correctly: `ls -la ~/.zshrc`
- The target should point to your dotfiles directory
