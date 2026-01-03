#!/bin/sh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "正在安装 Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_plugin() {
  name=$1
  repo=$2
  target="$ZSH_CUSTOM/plugins/$name"
  if [ ! -d "$target" ]; then
    echo "正在安装插件: $name..."
    git clone --depth=1 "$repo" "$target"
  fi
}


clone_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
clone_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
clone_plugin "zsh-history-substring-search" "https://github.com/zsh-users/zsh-history-substring-search"

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "正在安装 Powerlevel10k 主题..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

echo "Zsh 环境配置完成！"
