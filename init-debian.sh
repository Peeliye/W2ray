#!/bin/bash

read -p "Please input your hostname: " hostname
sed -i "s/example.com/$hostname/g" ./caddy/Caddyfile

read -p "Please input your email: " email
sed -i "s/example@gmail.com/$email/g" ./caddy/Caddyfile

password=$(head -c 8 /dev/random | base64)
sed -i "s/YOUR-PASSWORD/$password/g" ./caddy/Caddyfile

sudo apt-get install uuid-runtime

uuid=$(uuidgen)
sed -i "s/YOUR-UUID/$uuid/g" ./v2ray/config.json

echo "HOSTNAME: $hostname"
echo "EMAIL: $email"
echo "PASSWORD: $password"
echo "UUID: $uuid"
