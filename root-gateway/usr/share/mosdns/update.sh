#!/bin/bash
TMPDIR=$(mktemp -d) || exit 1
mosdns_data_dir="/var/mosdns/"
mkdir $mosdns_data_dir
echo 'update start'
cd $(mktemp -d)
curl https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/direct-list.txt > ./direct-list.txt
curl https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/proxy-list.txt > ./proxy-list.txt
curl https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/reject-list.txt > ./reject-list.txt
curl https://fastly.jsdelivr.net/gh/Loyalsoldier/geoip@release/text/cn.txt > ./cn.txt
\cp -rf ./*.txt $mosdns_data_dir
rm -rf ./* 
echo 'update successful'
