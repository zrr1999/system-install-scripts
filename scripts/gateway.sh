paru -S --noconfirm --needed yq smartdns mosdns-bin metacubexd mihomo

su root
bash /usr/share/mosdns/update.sh
bash /usr/share/mihomo/update.sh

systemctl enable mosdns
systemctl start mosdns
systemctl enable smartdns
systemctl start smartdns

systemctl enable mihomo
systemctl start mihomo
systemctl enable metacubexd
systemctl start metacubexd

(crontab -l 2>/dev/null; echo "0 3 1 * * bash /usr/share/mosdns/update.sh") | crontab
(crontab -l 2>/dev/null; echo "3 3 1 * * systemctl restart mosdns") | crontab
(crontab -l 2>/dev/null; echo "6 3 1 * * bash /usr/share/mihomo/update.sh") | crontab
(crontab -l 2>/dev/null; echo "9 3 1 * * systemctl restart mihomo") | crontab

ip rule add fwmark 0x161 lookup 100
ip rule add fwmark 0x162 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
