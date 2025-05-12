#!/bin/bash

# ┌────────────────────────────────────────────┐
# │  Script de instalación SIN KEY             │
# │  Compatible con Ubuntu 18.04 / 20.04 / 24.04│
# │  Actualizado por crisoda093                │
# └────────────────────────────────────────────┘

set -e

# Detectar versión de Ubuntu
ubuntu_version=$(lsb_release -rs)
echo "→ Detectando versión de Ubuntu: $ubuntu_version"

# Validar versión
if [[ "$ubuntu_version" != "18.04" && "$ubuntu_version" != "20.04" && "$ubuntu_version" != "24.04" ]]; then
  echo "✖ Este script solo funciona con Ubuntu 18.04, 20.04 y 24.04."
  exit 1
fi

# Actualizar sistema
echo "→ Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependencias comunes
echo "→ Instalando paquetes necesarios..."
sudo apt install -y apache2 php php-cli curl wget unzip git lsb-release software-properties-common

# Crear carpetas del proyecto
echo "→ Creando estructura de carpetas..."
mkdir -p ~/sin-key/{web,bin,logs}
chmod -R 755 ~/sin-key
chown -R $USER:$USER ~/sin-key

# Habilitar módulos de Apache
echo "→ Configurando Apache..."
sudo a2enmod rewrite
sudo systemctl restart apache2

# Comprobar estado del servicio Apache
echo "→ Estado de Apache:"
systemctl is-active apache2 && echo "✔ Apache está activo" || echo "✖ Apache NO está corriendo"

# Final
echo "✔ Instalación completa para Ubuntu $ubuntu_version"
echo "→ Carpeta de trabajo: ~/sin-key"
