#!/bin/sh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sfn "$DOTFILES_DIR/.zsh" ~/.zsh
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sfn "$DOTFILES_DIR/.tmux" ~/.tmux
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim

[ -d ~/.powerlevel10k ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

touch ~/.local_zsh_customization
