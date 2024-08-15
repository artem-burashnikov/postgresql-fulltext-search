#!/bin/bash
set -e

# Function to escape single quotes in text
escape_single_quotes() {
    echo "$1" | sed "s/'/''/g"
}

# Loop through only .txt files in the directory
for i in $PWD/examples/*.txt
do
  # Extract the filename without the directory path and extension
  FILENAME="${i##*/}"
  FILENAME="${FILENAME%.txt}"

  # Extract the author and title from the filename
  AUTHOR=$(echo "$FILENAME" | cut -d'-' -f1 | tr '_' ' ')
  TITLE=$(echo "$FILENAME" | cut -d'-' -f2- | tr '_' ' ')

  # Read the content of the file and escape special character
  LIT_TEXT=$(cat "$i")
  LIT_TEXT=$(escape_single_quotes "$LIT_TEXT")

  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
          INSERT INTO text_2024.classical_literature(author, title, text)
          VALUES('$AUTHOR', '$TITLE', '$LIT_TEXT');
EOSQL

done
