#!/bin/bash
# ===========================================
# Configuración SSH para GitHub 
# ===========================================

# 1. Pedir datos al usuario
read -p "Introduce tu email de GitHub: " EMAIL
read -p "Nombre del archivo de clave (ej: id_ed25519): " KEY_NAME
SSH_DIR="$HOME/.ssh"

# 2. Instalar OpenSSH si no está
if ! command -v ssh-keygen &>/dev/null; then
    echo "[+] Instalando OpenSSH..."
    sudo pacman -Sy --needed openssh
fi

# 3. Crear carpeta .ssh si no existe
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# 4. Generar la clave SSH
ssh-keygen -t ed25519 -C "$EMAIL" -f "$SSH_DIR/$KEY_NAME" -N ""

# 5. Activar el agente SSH y añadir la clave
eval "$(ssh-agent -s)"
ssh-add "$SSH_DIR/$KEY_NAME"

# 6. Configurar ~/.ssh/config
CONFIG_FILE="$SSH_DIR/config"
if ! grep -q "Host github.com" "$CONFIG_FILE" 2>/dev/null; then
    cat >> "$CONFIG_FILE" <<EOF
# Configuración para GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile $SSH_DIR/$KEY_NAME
    IdentitiesOnly yes
EOF
    chmod 600 "$CONFIG_FILE"
    echo "[+] Configuración añadida a $CONFIG_FILE"
else
    echo "[*] Ya existe configuración para github.com en $CONFIG_FILE"
fi

# 7. Mostrar clave pública para añadir a GitHub
echo
echo "======================"
echo "Clave pública generada"
echo "======================"
cat "$SSH_DIR/$KEY_NAME.pub"
