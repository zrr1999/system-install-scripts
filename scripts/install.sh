echo "Initializing pacman keyring"
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys

echo "Setting up pacman mirrorlist"
pacman -S --noconfirm --needed reflector
reflector --save /etc/pacman.d/mirrorlist --country China --protocol https --latest 5

echo "Installing basic tools"
pacman -S --noconfirm --needed base-devel vim git wget unzip cronie
pacman -S --noconfirm --needed iproute2 dnsutils lsof dhclient termshark

echo "Installing paru"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
