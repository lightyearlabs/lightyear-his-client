git reset --hard
git pull origin main

FILE=.env
if [ ! -f "$FILE" ]; then
  echo "$FILE does not exist."
  exit 1
fi

. .env
docker pull lightyearlabs/lightyear-his:$IMAGE_TAG
docker volume create dicom-vol
docker run -it \
  -p 3000:3000 \
  -p 4000:4000 \
  --env-file=.env \
  --mount source=dicom-vol,target=/home/dicomVol \
  lightyearlabs/lightyear-his:$IMAGE_TAG