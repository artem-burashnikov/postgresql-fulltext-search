#!/bin/bash

directory="examples"

if [ ! -d "$directory" ]; then
  echo "Directory $directory does not exist."
  exit 1
fi

for file in "$directory"/*.txt; do
  if [ -e "$file" ]; then
    line_count=$(wc -l < "$file")
    echo "$file has $line_count lines"
  fi
done
