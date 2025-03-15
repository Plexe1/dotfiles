#!/bin/bash

dot_dir=~/.dotfiles

yay -S zsh vi neovim hyprland sddm firefox dolphin plymouth zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd kitty rofi waybar zsh swww swaync fastfetch grim slurp qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg qt4-wayland qt6-wayland xdg-desktop-portal-hyprland cliphist uwsm wireplumber pipewire zsh-theme-powerlevel10k-git --needed -q

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

mkdir -p ~/Wallpapers
sudo cp -r --update=none ./GrubThemes/. /boot/grub/themes 
sudo cp -r --update=none ./PlymouthThemes/. /usr/share/plymouth/themes

rm -rf ~/.gitconfig && ln -sf $dot_dir/.gitconfig ~/.gitconfig 
rm -rf ~/.zprofile && ln -sf $dot_dir/.zprofile ~/.zprofile   
rm -rf ~/.zshrc && ln -sf $dot_dir/.zshrc ~/.zshrc   
rm -rf ~/.p10k.zsh && ln -sf $dot_dir/.p10k.zsh ~/.p10k.zsh 
rm -rf ~/.config/hypr && ln -sf $dot_dir/hypr ~/.config/hypr 
rm -rf ~/.config/kitty && ln -sf $dot_dir/kitty ~/.config/kitty
rm -rf ~/.config/nvim && ln -sf $dot_dir/nvim ~/.config/nvim
rm -rf ~/.config/waybar && ln -sf $dot_dir/waybar ~/.config/waybar
rm -rf ~/.config/rofi && ln -sf $dot_dir/rofi ~/.config/rofi

sudo plymouth-set-default-theme -R hexagon_2

sudo systemctl enable sddm.service
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
