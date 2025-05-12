#!/bin/bash
# Install-Sin-Key.sh - Instalador sin verificación de key
# Compatible con Ubuntu 20.04, 22.04 y 24.04
clear

# Colores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# Verificación de SO
[[ $(id -u) -ne 0 ]] && {
  echo -e "${RED}Este script debe ejecutarse como root.${NC}"
  exit 1
}

ubuntu_version=$(lsb_release -rs)
if [[ "$ubuntu_version" != "20.04" && "$ubuntu_version" != "22.04" && "$ubuntu_version" != "24.04" ]]; then
  echo -e "${YELLOW}Este script está diseñado para Ubuntu 20.04, 22.04 o 24.04.${NC}"
  exit 1
fi

# Funciones de instalación
install_oficial() {
  clear
  echo -e "${GREEN}Instalando SCRIPT 8.5 OFICIAL...${NC}"
  mkdir -p /bin/ejecutar
  echo "$(date +%d-%m-%y)" >/bin/ejecutar/fecha
  echo "0 MB" >/bin/ejecutar/raml
  wget -O /etc/versin_script_new https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.5x%20Mod/Version &>/dev/null

  # Mensaje en .bashrc
  cat << 'EOF' >> /root/.bashrc

clear
figlet -k ChumoGH | lolcat
echo ""
bash /bin/ejecutar/echo-ram.sh
echo -e " Fecha de Instalacion : $(cat /bin/ejecutar/fecha)"
echo -e " Nombre del Servidor : $HOSTNAME"
echo -e " Tiempo en Linea     : $(uptime -p)"
echo -e " Memoria Libre       : $(cat /bin/ejecutar/raml)"
echo -e " Fecha del Servidor  : $(date +"%d-%m-%y")"
echo -e " Hora del Servidor   : $(date +"%T")"
echo ""
echo -e " Bienvenido!"
echo -e "\033[1;43m Teclee cgh , menu o adm para ver el MENU \033[0m"
EOF

  echo "desactivado" >/bin/ejecutar/val1
  echo "0" >/bin/ejecutar/val
  echo "0" >/bin/ejecutar/uskill

  [[ -e /bin/ejecutar/menu_credito ]] || {
    mkdir -p /etc/adm-lite
    echo "SCRIPT CREDITOS" >/etc/adm-lite/menu_credito
    echo "$(cat /etc/adm-lite/menu_credito)" >/bin/ejecutar/menu_credito
    chmod +x /bin/ejecutar/menu_credito
  }

  echo "Verified【 $(cat /bin/ejecutar/menu_credito) 】" >/bin/ejecutar/exito

  # Reiniciar SSH si es necesario
  systemctl restart ssh &>/dev/null
  clear
  echo -e "${GREEN}>> INSTALACIÓN COMPLETADA <<${NC}"
  echo -e " Comando principal para entrar al panel:"
  echo -e "        ${YELLOW}menu${NC}"
}

install_mod() {
  echo ">> Opción aún no implementada. Puedes personalizar esta sección. <<"
}

install_ADMRufu() {
  echo ">> Opción aún no implementada. Puedes personalizar esta sección. <<"
}

install_ChumoGH() {
  echo ">> Opción aún no implementada. Puedes personalizar esta sección. <<"
}

install_latam() {
  echo ">> Opción aún no implementada. Puedes personalizar esta sección. <<"
}

# Menú
clear
echo -e "${BLUE}===================== MENU DE INSTALACIÓN =====================${NC}"
echo -e "${YELLOW}[1]${NC} Instalar SCRIPT 8.5 OFICIAL"
echo -e "${YELLOW}[2]${NC} Instalar SCRIPT 8.6x MOD"
echo -e "${YELLOW}[3]${NC} Instalar ADMRufu MOD"
echo -e "${YELLOW}[4]${NC} Instalar ChumoGH MOD"
echo -e "${YELLOW}[5]${NC} Instalar LATAM 1.1g (Organizando ficheros)"
echo -e "${BLUE}==============================================================${NC}"
read -p "Seleccione una opción [1-5]: " opcao

case $opcao in
  1) install_oficial ;;
  2) install_mod ;;
  3) install_ADMRufu ;;
  4) install_ChumoGH ;;
  5) install_latam ;;
  *) echo -e "${RED}Opción inválida.${NC}" ;;
esac

exit 0
