#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.screenrc ~/.screenrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
touch ~/.local_zsh_customization
