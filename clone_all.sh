#!/bin/bash

workingdir="temp"
file="links.txt"

test -d "$workingdir" && rm -rf "$workingdir"
mkdir $workingdir
while IFS="" read -r repo || [ -n "$repo" ]; do
    git clone "$repo" "$workingdir/${repo##*/}" # clone all the repos into a directory called repos
done <$file
