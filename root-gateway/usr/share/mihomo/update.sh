#!/bin/bash

if [ ! -f /usr/share/mihomo/subscription.yaml ]; then
  echo "subscription.yaml is not found, please input a name and a link:"
  read -p "name: " name
  read -p "link: " link
  mkdir -p /usr/share/mihomo
  touch /usr/share/mihomo/subscription.yaml
  echo "use: $name" > /usr/share/mihomo/subscription.yaml
  echo "subscriptions:" >> /usr/share/mihomo/subscription.yaml
  echo "  $name: $link" >> /usr/share/mihomo/subscription.yaml
fi

use=$(yq e ".use" /usr/share/mihomo/subscription.yaml)
link=$(yq e ".subscriptions.$use" /usr/share/mihomo/subscription.yaml)

if [ -z "$link" ]; then
  echo "link not found."
  exit 1
fi

curl -o /etc/mihomo/original.yaml -A "clash-verge/1.7.5" $link
bash /usr/share/mihomo/merge.sh
