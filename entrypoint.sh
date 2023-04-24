#!/bin/sh

# Function to handle signals
cleanup() {
  echo "Received signal, stopping snell-server..."
  kill -s TERM "$(pidof snell-server)"
  exit 0
}

# Trap signals
trap 'cleanup' INT TERM

if [ -z "$PSK" ]; then
  PSK=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
fi

cat > snell-server.conf << EOL
[snell-server]
listen = 0.0.0.0:8182
psk = $PSK
obfs = http
EOL

echo "Port: 8182"
echo "PSK: $PSK"

snell-server -c snell-server.conf & wait
