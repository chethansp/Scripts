#!/bin/bash

echo "webex: present working dir ${PWD}"

CWD=${PWD}
PROJNAME=$1

cd ~/.${PROJNAME}

BUILD_URL=$(cat ./buildpath.txt)
ROOM_ID=$(cat ./room.txt)
TOKEN=$(cat ./token.txt)
BUILD_TAG=$(cat ./tag.txt)

echo "webex: Build URL ${BUILD_URL}"
echo "webex: Room_ID  ${ROOM_ID}"
echo "webex: Token ${TOKEN}"
echo "webex: Build tag ${BUILD_TAG}"

cd ${CWD}
echo "webex: switch back to ${PWD}"

curl ${BUILD_URL}/consoleText > ../log.txt
sed -n '/Testing failed/','/FAILED \*\*/'p ../log.txt > ../failed_tests.txt

FAILED_TESTS=$(cat ../failed_tests.txt)

TEXT=$(echo -e "${BUILD_TAG}\n failed test: ${FAILED_TESTS}")

curl --request POST --header "Authorization:Bearer ${TOKEN}"  --form "roomId=${ROOM_ID}" --form "text=${TEXT}" --form "files=@../log.txt" https://api.ciscospark.com/v1/messages

#Remove credential
echo "webex: Removing credentail folder"
rm -rf ~/.${PROJNAME}

#Remove log files

rm ../log.txt
rm ../failed_tests.txt
echo "webex: Removed log files"
