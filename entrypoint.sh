#!/bin/bash

v2ray -config=/v2ray/config.json
caddy --conf /caddy/Caddyfile --agree=true
