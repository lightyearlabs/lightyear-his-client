#!/bin/bash

git reset --hard
git pull origin main

FILE=.env
if [ ! -f "$FILE" ]; then
  echo "$FILE does not exist."
  exit 1
fi

source .env
docker compose build
docker compose up