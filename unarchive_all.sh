#!/usr/bin/env bash

file="links.txt"

while IFS="" read -r repo || [ -n "$repo" ]; do
    gh repo unarchive "$repo" -y
done <$file
