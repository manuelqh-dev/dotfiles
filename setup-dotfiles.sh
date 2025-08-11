#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/manuelqh-dev/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "[+] Preparando carpeta para dotfiles..."
mkdir -p "$DOTFILES_DIR"

if [ -d "$DOTFILES_DIR/.git" ]; then
    echo "[!] Ya existe un repositorio en $DOTFILES_DIR, actualizando..."
    git -C "$DOTFILES_DIR" pull
else
    echo "[+] Clonando dotfiles desde $REPO_URL..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

echo "[+] Copiando archivos de configuración a ~/.config..."

mkdir -p ~/.config/hypr ~/.config/hypr/themes ~/.config/waybar ~/.config/waybar/themes ~/.config/mako ~/.config/alacritty ~/.config/alacritty/themes ~/.config/wofi ~/.config/nvim

cp -r "$DOTFILES_DIR/linux/.config/hypr/"* ~/.config/hypr/
cp -r "$DOTFILES_DIR/linux/.config/waybar/"* ~/.config/waybar/
cp -r "$DOTFILES_DIR/linux/.config/mako/"* ~/.config/mako/
cp -r "$DOTFILES_DIR/linux/.config/alacritty/"* ~/.config/alacritty/
cp -r "$DOTFILES_DIR/linux/.config/wofi/"* ~/.config/wofi/
cp -r "$DOTFILES_DIR/linux/.config/nvim/"* ~/.config/nvim/
cp "$DOTFILES_DIR/linux/.zshrc" ~/.zshrc
cp "$DOTFILES_DIR/linux/.p10k.zsh" ~/.p10k.zsh"
cp "$DOTFILES_DIR/linux/.gitconfig" ~/.gitconfig"

echo "[✓] Dotfiles copiados con éxito."

# Opcional: eliminar el repositorio clonado
# rm -rf "$DOTFILES_DIR"
