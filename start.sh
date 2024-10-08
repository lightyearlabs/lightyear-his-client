#!/bin/bash

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