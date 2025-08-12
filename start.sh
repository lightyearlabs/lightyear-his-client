#!/bin/bash

open -a Docker

echo "Waiting for Docker to start..."
while ! docker system info >/dev/null 2>&1; do
    sleep 1
done

echo "Docker is ready, running script..."

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