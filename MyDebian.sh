#!/bin/bash

# Verificar si el script se ejecuta como root (administrador)
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root (usando sudo)."
  exit 1
fi

clear
echo "========================================="
echo "   INSTALADOR DE PROGRAMAS PARA DEBIAN 13"
echo "========================================="
echo

# 1. Actualizar el sistema antes de instalar
echo "[*] Actualizando índices de paquetes..."
apt update && apt upgrade -y
echo "[OK] Sistema listo."
echo

# 2. Instalación de programas generales
echo "[*] Instalando programas base..."
sudo apt install vim-gtk3 xfe idesk feh git tlp acpi unattended-upgrades unrar-free curl wget  p7zip-full htop btop extrepo arandr network-manager pulseaudio alsa-utils volumeicon-alsa pavucontrol udiskie eject gsimplecal wget curl fastfetch mc ftp vim irssi newsboat diodon mutt timeshift bleachbit xpad gparted gsmartcontrol galculator qbittorrent liferea smplayer i3lock scrot imagemagick synaptic papirus-icon-theme alacritty
echo "[OK] Programas base completados."
echo

# 3. Condicional IF para componentes Bluetooth
read -p "¿Deseas instalar las aplicaciones y drivers de Bluetooth? (s/n): " respuesta

# Convertir la respuesta a minúscula para validar más fácil
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [ "$respuesta" = "s" ] || [ "$respuesta" = "si" ]; then
    echo
    echo "[*] Instalando componentes de Bluetooth..."
    # Instala el stack de bluetooth, utilidades de consola y el gestor grafico Blueman
    apt install bluez blueman pulseaudio-module-bluetooth bluez-tools
    
    echo "[*] Habilitando el servicio de Bluetooth..."
    systemctl enable bluetooth
    systemctl start bluetooth
    echo "[OK] Bluetooth instalado y activo."
else
    echo
    echo "[X] Instalación de Bluetooth omitida."
fi

# 4. Condicional IF para Flatpak
read -p "¿Deseas instalar las Flatpak? (s/n): " respuesta

# Convertir la respuesta a minúscula para validar más fácil
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [ "$respuesta" = "s" ] || [ "$respuesta" = "si" ]; then
    echo
    echo "[*] Instalando Flatpak..."
    apt install flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    
else
    echo
    echo "[X] Instalación de Flatpak omitida."
fi

echo
echo "========================================="
echo "   Proceso finalizado con éxito."
echo "========================================="
