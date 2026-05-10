# Debian Setup

1.Descargar Debian 13 net install o standard.

# Elimine las particiones
1. Ver información de las particiones.
	
	lsblk
	
2. Ejecutar:

	sudo fdisk
	
3. En fdisk ejecutar g y darle si esto creara una nueva tabla de particiones.

# Instalando Debian 13

1.Inicie la instalación e ingrese la información.

2.Ingrese su usuario y password

3. Cree las particiones:

	3.1. Select Manual Installation and Select your HardDrive.
	
	3.2. EFI PARTITION----->300 MB--> EFI---->N/A
	
	3.3. KERNEL PARTITION-->2 GB----> EXT4--->/BOOT
	
	3.4. SWAP PARTITION---->17GB(MEM RAM+1)-->N/A
	
	3.5. ROOT PARTITION---->90 GB--->BTRFS->/
	
	3.6. HOME PARTITION---->ALL----->EXT4/XFS->/HOME

4. Finalizar la instalación.

## Configurando BTRFS para poder usar Timeshift

1. Ejecutar el comando:
  
  		df -Th
   
2. Montar el volumen BTRFS usando el comando:

   		sudo mount /dev/nvem01p4 /mnt

3. Moverse al /mnt y ejecutar la orden ls -l

4. Como resultado aparecera lo siguiente @rootfs

5. Moverse a cd @rootfs, esto entrara en el root folder, dentro del subvolumen.

6. Regresar y renombrar ****@rootfs** a @: 

       sudo mv @rootfs/ @

7. Ejecutar: ls -l, donde antes decia **@rootfs ahora dira @**

8. Ejecutar:

    	sudo nano /etc/fstab

9. En ese archivo buscar a donde se esta montando el subvolumen **@rootfs, y modificar por @**

10. Salvar el Archivo fstab

11. Actualizar Grub:

    	sudo update-grub

12. Reiniciar con :

      sudo shutdown -r now

## Home Desktop Install
	
	sudo apt install icewm lightdm git tlp acpi unattended-upgrades unrar-free  p7zip-full htop btop extrepo arandr network-manager network-manager-gnome pulseaudio alsa-utils volumeicon-alsa pavucontrol udiskie eject idesk feh wget curl fastfetch mc ftp vim irssi newsboat diodon xfe timeshift  bleachbit xpad gparted gsmartcontrol galculator qbittorrent smplayer i3lock scrot imagemagick bluez blueman pulseaudio-module-bluetooth bluez-tools flatpak

## Games

	sudo apt install crawl-tiles aisleriot skladnik xye wesnoth dosbox gnome-mines

## Development

	sudo apt install emacs default-jdk default-jre geany python3-pip nodejs gdb build-essential sqlite3 sqlitebrowser filezilla putty putty-tools
	
## Crear Snapshot "Clean Install" ejecutando:

    sudo timeshift --btrfs

    sudo timeshift --create --comments "Clean install"

## Otros comandos útiles

### Reconfigurar locales:

	sudo dpkg-reconfigure locales

### Añadir repos para instalar Chrome:

	sudo extrepo enable google_chrome

### Add this line to lightdm.conf to remember the last user:

	[Seat:*]
	greeter-hide-users=false

### Add this line to lightdm-gtk-greeter.conf

	hide-user-image = true

	indicators = ~host;~spacer;~clock;~spacer;~session;~layout;~a11y;~power

### Instalar Flatpack

Instalar:

	  sudo apt update && sudo apt install flatpak

Añade Repositorios:

  	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

### Add, Delete Users
Añade un usuario:

	sudo adduser adolfo

Borra un usuario:

	sudo deluser adolfo

Boora un usuario y el folder home:

	sudo deluser --remove-home adolfo

Añade el usuario a sudoers:

	sudo usermod -aG sudo adolfo

### Habilitar Actualizaciones Automáticas

Actualiza e instala los paquetes necesarios:

	sudo apt update && sudo apt install unattended-upgrades

Llamar el asistente de Configuración:

	sudo dpkg-reconfigure --priority=low unattended-upgrades

Revisa la configuarción

	sudo nano /etc/apt/apt.conf.d/20auto-upgrades

Debe Contener lo siguiente:

	APT::Periodic::Update-Package-Lists "1";
	APT::Periodic::Unattended-Upgrade "1";


### Instalar Wine

	https://gitlab.winehq.org/wine/wine/-/wikis/Debian-Ubuntu

### Enlace simbolico a Deadbeef lml

sudo ln -s /opt/deadbeef/bin/deadbeef /usr/bin/deadbeef

xdg-mime default pcmanfm.desktop inode/directory




	




