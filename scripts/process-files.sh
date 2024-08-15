#!/bin/bash

# Directory containing the .txt files
directory="examples"

if [ ! -d "$directory" ]; then
  echo "Directory $directory does not exist."
  exit 1
fi

for file in "$directory"/*.txt; do
  if [ ! -e "$file" ]; then
    echo "No .txt files found in $directory."
    exit 1
  fi

  # Replace all newlines with spaces, and ensure a final newline
  tr '\n' ' ' < "$file" | sed 's/ $/\n/' > temp_file

  # Replace the original file with the modified one, preserving the file name
  mv temp_file "$file"

  echo "Processed: $file"
done

echo "All files processed."
