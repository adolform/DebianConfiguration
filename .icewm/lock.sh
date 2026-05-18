#!/bin/bash
# 1. Tomar una captura de pantalla
scrot /tmp/screen_lock.png

# 2. Aplicar desenfoque (blur) a la imagen
convert /tmp/screen_lock.png -blur 0x8 /tmp/screen_lock.png

# 3. Bloquear la pantalla con la imagen procesada
i3lock -i /tmp/screen_lock.png

# 4. Limpiar la imagen al desbloquear
rm /tmp/screen_lock.png
