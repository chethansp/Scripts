#!/bin/bash

echo "webex: Removing  webex credentials"

#Remove credential folder
PROJNAME=$1
rm -rf ~/.${PROJNAME}
