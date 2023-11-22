#!/usr/bin/env bash

workingdir="temp"
file="links.txt"
account="sudoalphax"

test -d "$workingdir" && rm -rf "$workingdir"
mkdir $workingdir
while IFS="" read -r repo || [ -n "$repo" ]; do
        git clone "$repo" "$workingdir/${repo##*/}" # clone all the repos into a directory called workingdir
        sleep 1
done <$file

cd $workingdir || exit

for dir in *; do
        (
                cd "$dir" || echo "error $dir"
                # gh repo unarchive "$account/$dir" -y
                # sleep 1
                git-filter-repo --mailmap ../../.mailmap --force
                git remote add origin https://github.com/"$account/$dir"
                sleep 1
                git push --set-upstream origin main -f
                sleep 1
                git push --set-upstream origin master -f
                sleep 1
                # gh repo archive "$account/\$dir" -y
                # sleep 1
                cd ..
        )
done
