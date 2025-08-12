#!/bin/bash

# 1. Instalar Firejail si no está
if ! command -v firejail &>/dev/null; then
  echo "[+] Instalando Firejail..."
  sudo pacman -Sy --needed firejail
else
  echo "[*] Firejail ya está instalado."
fi

# 2. Crear alias para Firefox con Firejail en ~/.zshrc si no existe
if ! grep -q "alias firefox=" ~/.zshrc 2>/dev/null; then
  echo "alias firefox='firejail firefox'" >> ~/.zshrc
  echo "[+] Alias para Firefox con Firejail añadido a ~/.zshrc"
else
  echo "[*] Alias para Firefox ya existe en ~/.zshrc"
fi

# 3. Crear lanzador .desktop para Firefox con Firejail
DESKTOP_FILE="$HOME/.local/share/applications/firefox-firejail.desktop"
mkdir -p "$(dirname "$DESKTOP_FILE")"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Firefox (Firejail)
Terminal=false
Exec=firejail /usr/lib/firefox-developer-edition/firefox %u
Icon=firefox
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true

EOF

echo "[+] Lanzador firefox-firejail.desktop creado en $DESKTOP_FILE"

echo "[+] Configuración Firejail completada."
