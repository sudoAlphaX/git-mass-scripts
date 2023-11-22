#!/usr/bin/env bash

file="links.txt"

while IFS="" read -r repo || [ -n "$repo" ]; do
    gh repo archive "$repo" -y
done <$file
