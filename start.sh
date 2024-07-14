git reset --hard
git pull origin main
systemctl start docker

FILE=.env
if [ ! -f "$FILE" ]; then
  echo "$FILE does not exist."
  exit 1
fi

docker pull lightyearlabs/lightyear-his:client-latest
docker run -it -p 3000:3000 -p 4000:4000 --env-file=.env lightyearlabs/lightyear-his:client-latest