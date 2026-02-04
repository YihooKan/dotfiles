#!/usr/bin/env zsh
# --- 自动化配置框架 ---
export DOTFILES_DIR="${${(%):-%N}:A:h}"
export ZSH="$HOME/.oh-my-zsh"

# [1] 加载所有 pre 模块
if [ -d "$DOTFILES_DIR/zsh/pre.d" ]; then
  for config in "$DOTFILES_DIR/pre.d"/*.zsh; do
    source "$config"
  done
fi

# [2] 加载 OMZ 基础设置 (变量、插件名等)
source "$DOTFILES_DIR/basic.zsh"

# [3] 启动 Oh My Zsh 引擎
source "$ZSH/oh-my-zsh.sh"

# [4] 加载所有 post 模块 (Alias, Function, UI)
if [ -d "$DOTFILES_DIR/zsh/post.d" ]; then
  for config in "$DOTFILES_DIR/zsh/post.d"/*.zsh; do
    source "$config"
  done
fi

# [5] 加载本地自定义配s置 (不纳入版本控制)
if [ -d "$DOTFILES_DIR/zsh/local.d" ]; then
  for config in "$DOTFILES_DIR/zsh/local.d"/*.zsh; do
    source "$config"
  done
fi
