#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'Too few args, supply at least SOURCEDIR as arg 1, optionally EXEC as 2'
	exit 0
elif [ $# -eq 1 ]; then
	if test -f goaldis; then
		EXEC=./goaldis
		SOURCEDIR=$1
	else
		echo 'Error, no goaldis executable found! Supply as arg 2 please.'
		exit 0
	fi
elif [ $# -eq 2 ]; then
        EXEC=$2
        SOURCEDIR=$1
else
	echo 'Too many args!'
	exit 0
fi

for file in $(find "$SOURCEDIR" -type f \( -iname \*.CGO -o -iname \*.DGO \))
do
	mkdir -p {bin,asm}/$(basename ${file%.*} | tr '[:upper:]' '[:lower:]')
	"$EXEC" -bin bin/$(basename ${file%.*} | tr '[:upper:]' '[:lower:]') $file > /dev/null
	"$EXEC" -asm asm/$(basename ${file%.*} | tr '[:upper:]' '[:lower:]') $file > /dev/null
done
