#!/bin/bash

# 1. Define las parejas de rutas: "ORIGEN DESTINO"
ENLACES=(
    "$HOME/DebianConfiguration/.vimrc $HOME/.vimrc"
    "$HOME/DebianConfiguration/.ideskrc $HOME/.ideskrc"
    "$HOME/DebianConfiguration/.Xresources $HOME/.Xresources"
    "$HOME/DebianConfiguration/Wallpapers $HOME/"
    "$HOME/DebianConfiguration/.icewm $HOME/"
    "$HOME/DebianConfiguration/.idesktop $HOME/"
    "$HOME/DebianConfiguration/.newsboat $HOME/"
    "$HOME/DebianConfiguration/gtk-3.0 $HOME/.config/"
)

# 2. Crear los enlaces simbólicos
for pareja in "${ENLACES[@]}"; do
    ln -s $pareja
    echo "Enlace creado para: $pareja"
done
