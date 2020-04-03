#!/bin/sh
set -e

if ! [ -e laravel-echo-server.json ]; then
  cp laravel-echo-server.example.json laravel-echo-server.json
fi

sed -i -e "s%{{ ECHO_CLIENTS }}%$ECHO_CLIENTS%g" laravel-echo-server.json
sed -i -e "s%{{ ECHO_ALLOW_CORS }}%$ECHO_ALLOW_CORS%g" laravel-echo-server.json
sed -i -e "s%{{ ECHO_ALLOW_ORIGIN }}%$ECHO_ALLOW_ORIGIN%g" laravel-echo-server.json
sed -i -e "s%{{ ECHO_ALLOW_METHODS }}%$ECHO_ALLOW_METHODS%g" laravel-echo-server.json
sed -i -e "s%{{ ECHO_ALLOW_HEADERS }}%$ECHO_ALLOW_HEADERS%g" laravel-echo-server.json

$@
