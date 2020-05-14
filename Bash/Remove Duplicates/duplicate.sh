#!/usr/bin/env bash

echo "This script will sort and remove the duplicate"
echo "Pass the file name as parameter"

FILENAME=$1

cat $1 | tail -r  | awk -F " " '!_[$1]++' | tail -r
