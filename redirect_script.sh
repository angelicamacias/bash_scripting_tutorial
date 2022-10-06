#!/bin/bash
#set -x

MAX_NUM=$1

if [[ -f file.txt ]]; then
	rm file.txt
fi

for i in $(seq 1 $MAX_NUM); do
	echo "this will get redirected to a file line ${i}" >> file.txt
done

