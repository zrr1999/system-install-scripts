echo "Installing paru"
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
makepkg -si
cd ~
rm -rf /tmp/paru
