paru -S --noconfirm --needed go-yq smartdns mosdns-bin metacubexd mihomo

su root
bash /usr/share/mosdns/update.sh
bash /usr/share/mihomo/update.sh

systemctl enable --now mosdns
systemctl enable --now smartdns
systemctl enable --now mihomo
systemctl enable --now nftables

(crontab -l 2>/dev/null; echo "0 3 1 * * bash /usr/share/mosdns/update.sh") | crontab
(crontab -l 2>/dev/null; echo "3 3 1 * * systemctl restart mosdns") | crontab
(crontab -l 2>/dev/null; echo "6 3 1 * * bash /usr/share/mihomo/update.sh") | crontab
(crontab -l 2>/dev/null; echo "9 3 1 * * systemctl restart mihomo") | crontab

ip rule add fwmark 0x161 lookup 100
ip rule add fwmark 0x162 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
