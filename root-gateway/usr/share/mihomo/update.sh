#!/bin/bash

curl -o /etc/mihomo/original.yaml -A "clash-verge/1.7.5" $1
bash /usr/share/mihomo/merge.sh
