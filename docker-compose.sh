#!/bin/bash

# author @soulteary
# date 2021/01/31

BASEURL="https://github.com/docker/compose/releases/download"
FILENAME="docker-compose-`uname -s`-`uname -m`"
VERSION=1.28.2

if [ -f "$FILENAME" ]; then
    echo "$FILENAME exists.";
else
    curl -L ${BASEURL}/${VERSION}/${FILENAME} -o ${FILENAME}
fi

curl -L ${BASEURL}/${VERSION}/${FILENAME}.sha256 -o ${FILENAME}.sha256

CHECK=$(shasum -c ${FILENAME}.sha256)

if [ $? != 0 ]; then
    echo "${FILENAME} checksum is not valid";
    exit 1;
fi

mv ${FILENAME} /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
rm ${FILENAME}.sha256

echo "done";
docker-compose -v
