#!/bin/bash

dot_dir=~/.dotfiles

yay -S zsh neovim hyprland firefox zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting ttf-jetbrains-mono-nerd kitty rofi waybar zsh swww swaync fastfetch grim slurp qt4-wayland qt6-wayland xdg-desktop-portal-hyprland cliphist uwsm wireplumber pipewire zsh-theme-powerlevel10k-git --needed --no-confirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

sudo mkdir -p /wallpapers
sudo cp -r ./GrubThemes/. /boot/grub/themes 

ln -sf $dot_dir/.gitconfig ~/.gitconfig 
ln -sf $dot_dir/.zprofile ~/.zprofile   
ln -sf $dot_dir/.zshrc ~/.zshrc   
ln -sf $dot_dir/.p10k.zsh ~/.p10k.zsh 
ln -sf $dot_dir/hypr ~/.config/hypr 
ln -sf $dot_dir/kitty ~/.config/kitty
ln -sf $dot_dir/nvim ~/.config/nvim
ln -sf $dot_dir/waybar ~/.config/waybar
ln -sf $dot_dir/rofi ~/.config/rofi
