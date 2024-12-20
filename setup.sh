#!/bin/zsh

dot_dir = ~/.dotfiles

ln -sf $dot_dir/.gitconfig ~/.gitconfig 
ln -sf $dot_dir/.zprofile ~/.zprofile   
ln -sf $dot_dir/.zshrc ~/.zshrc   
ln -sf $dot_dir/.p10k.zsh ~/.p10k.zsh 
ln -sf $dot_dir/hypr ~/.config/hypr 
ln -sf $dot_dir/kitty ~/.config/kitty
ln -sf $dot_dir/nvim ~/.config/nvim
ln -sf $dot_dir/waybar ~/.config/waybar
ln -sf $dot_dir/rofi ~/.config/rofi
