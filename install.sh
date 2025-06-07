#!/bin/bash

set -e

# Comprobación de root (solo para comandos necesarios)
if [[ "$EUID" -ne 0 ]]; then
  echo "Por favor, ejecuta este script con permisos de superusuario (sudo)."
  exit 1
fi

echo "[1/9] Instalando bspwm y sxhkd..."
sudo pacman -S --noconfirm bspwm sxhkd

echo "[2/9] Instalando dependencias..."
sudo pacman -S --noconfirm playerctl zsh ranger neovim alacritty dunst thunar rofi flameshot nitrogen polybar picom brightnessctl ttf-font-awesome

echo "[3/9] Instalando betterlockscreen desde AUR (requiere yay)..."
if ! command -v yay &>/dev/null; then
  echo "yay no está instalado. Por favor instala yay y vuelve a ejecutar el script."
  exit 1
fi
yay -S --noconfirm betterlockscreen

echo "[4/9] Clonando configuración desde GitHub..."
cd ~
git clone -b aoi https://github.com/Yumiko0828/dotfiles.git
cd dotfiles
cp -r .config/* ~/.config/
cp .xinitrc ~
echo "✔ Archivos de configuración copiados."

echo "[5/9] Instalando fuentes..."
sudo mkdir -p /usr/share/fonts
sudo cp -r fonts/* /usr/share/fonts
fc-cache -fv
echo "✔ Fuentes actualizadas."

echo "[6/9] Instalando Oh My Zsh..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[7/9] Instalando Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "[8/9] Instalando plugins de ZSH..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "[9/9] Configurando .zshrc..."
cp .zshrc ~
source ~/.zshrc

echo "🎉 Instalación del tema Aoi completada. Reinicia tu sesión para aplicar los cambios."
