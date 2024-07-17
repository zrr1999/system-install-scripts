#!/bin/bash
TMPDIR=$(mktemp -d) || exit 1
mosdns_data_dir="/var/mosdns/"
mkdir $mosdns_data_dir
echo 'update start'
cd $(mktemp -d)
curl https://fastly.jsdelivr.net/gh/pmkol/easymosdns@rules/china_domain_list.txt > ./china_domain_list.txt
curl https://fastly.jsdelivr.net/gh/pmkol/easymosdns@rules/cdn_domain_list.txt > ./cdn_domain_list.txt 
curl https://fastly.jsdelivr.net/gh/pmkol/easymosdns@rules/gfw_domain_list.txt > ./gfw_domain_list.txt
curl https://fastly.jsdelivr.net/gh/pmkol/easymosdns@rules/ad_domain_list.txt > ./ad_domain_list.txt
curl https://fastly.jsdelivr.net/gh/pmkol/easymosdns@rules/china_ip_list.txt > ./china_ip_list.txt
curl https://fastly.jsdelivr.net/gh/pmkol/easymosdns@rules/gfw_ip_list.txt > ./gfw_ip_list.txt
\cp -rf ./*.txt $mosdns_data_dir
rm -rf ./* 
echo 'update successful'