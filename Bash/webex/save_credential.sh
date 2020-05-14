#!/bin/bash

echo "webex: Saving the webex credentail"

CWD=${PWD}
PROJNAME=$1

echo "webex: current path ${CWD}"

if [ -d ~/.${PROJNAME} ]
then
    rm -rf ~/.${PROJNAME}
fi

mkdir ~/.${PROJNAME}
cd  ~/.${PROJNAME}

echo ${BUILD_URL} > buildpath.txt
echo ${ROOM_ID} > room.txt
echo ${WEBEX_TOKEN} > token.txt
echo ${BUILD_TAG} > tag.txt

cd ${CWD}

echo "webex: final path ${CWD}"
