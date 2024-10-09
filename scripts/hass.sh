paru -Sy homeassistant-supervised

su root
pacman -S --noconfirm --needed apparmor
systemctl enable --now hassio-supervisor
systemctl enable --now hassio-apparmor
