#!/bin/bash

# Instalación sin llave para Ubuntu 24.04
# Repositorio: https://github.com/crisoda093/PLAYSERVER

echo "Iniciando instalación... por favor espera."

# Actualizamos el sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Instalación de dependencias necesarias
echo "Instalando dependencias..."
sudo apt install -y \
  curl \
  wget \
  git \
  build-essential \
  python3 \
  python3-pip \
  python3-dev \
  libssl-dev \
  libffi-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  liblzma-dev \
  g++ \
  make \
  unzip \
  sudo \
  vim \
  nano

# Instalamos herramientas útiles
echo "Instalando herramientas adicionales..."
sudo apt install -y net-tools nmap htop

# Instalamos Docker (si es necesario)
echo "Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Instalamos Docker Compose (si es necesario)
echo "Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Configuración para el uso de Docker sin sudo
echo "Configurando Docker para el usuario sin sudo..."
sudo usermod -aG docker $USER

# Instalamos el repositorio desde GitHub
echo "Clonando el repositorio de GitHub..."
git clone https://github.com/crisoda093/PLAYSERVER.git

# Cambio al directorio del repositorio
cd PLAYSERVER

# Si hay un script de instalación dentro del repositorio, lo ejecutamos
if [ -f "Install-Sin-Key.sh" ]; then
  echo "Ejecutando script Install-Sin-Key.sh del repositorio..."
  chmod +x Install-Sin-Key.sh
  ./Install-Sin-Key.sh
else
  echo "No se encontró el script Install-Sin-Key.sh en el repositorio."
fi

# Finalizamos
echo "¡Instalación completada exitosamente! Por favor reinicia el sistema para que todos los cambios surtan efecto."
