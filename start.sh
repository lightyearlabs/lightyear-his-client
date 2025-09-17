#!/bin/bash

# Start OrbStack if not running
if ! pgrep -x "OrbStack" >/dev/null; then
  echo "Starting OrbStack..."
  open -a OrbStack
fi

# Wait until OrbStack is ready
echo "Waiting for OrbStack to be ready..."
until docker info >/dev/null 2>&1; do
  sleep 2
done

echo "OrbStack is ready"

git reset --hard
git pull

FILE=.env
if [ ! -f "$FILE" ]; then
  echo "$FILE does not exist."
  exit 1
fi

source .env
docker compose down
docker compose pull
docker compose build
docker compose up --timestamps