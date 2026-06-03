#!/bin/bash
echo "=== Iniciando la instalación de WineHQ en Debian 13 (Trixie) ==="
# 1. Descargar e instalar la clave pública del repositorio de WineHQ
echo "[1/5] Creando directorio de llaves e importando clave GPG..."
sudo mkdir -pm755 /etc/apt/keyrings
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -

# 2. Habilitar la arquitectura de 32 bits (Multiarch)
echo "[2/5] Habilitando arquitectura de 32 bits..."
sudo dpkg --add-architecture i386

# 3. Agregar el repositorio oficial de WineHQ para Debian 13
echo "[3/5] Agregando el repositorio de WineHQ para Debian Trixie..."
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources

# 4. ACtualizar repositorios de APT
echo "[4/5] Actualizando los repositorios de APT..."
sudo apt update

# 5. Instalando WineHQ
echo "[5/5] Instalando WineHQ Estable y sus dependencias..."
sudo apt install --install-recommends winehq-stable -y