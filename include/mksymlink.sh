#!/bin/sh

# All paths must be full
linkname=$1
target=$2
attic=$3

# check if symlink is already in place
test "$(realpath "$linkname")" = "$target" && exit 0

# ensure link dir exist
mkdir -p "$(dirname "$linkname")"

# move old target to attic
mkdir -p "${attic}$(dirname "$linkname")"
mv "$linkname" "${attic}${linkname}-$(date +%s)"

# link
ln -s "$target" "$linkname"
