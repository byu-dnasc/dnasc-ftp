#!/bin/bash

# Check that only one argument is provided
[ $# -ne 1 ] && echo "Usage: $0 <files_to_transfer.fofn>" \
	     && exit 1

FOFN="$1"

# Check if the FOFN file exists
[ ! -f "$FOFN" ] && echo "Error: '$FOFN' not found." \
                 && exit 1

read -p "Please provide a name for this transfer. This \
will also be the name of the new directory in which the \
files will be deposited." NEW_DIR_NAME

BATCH_FILE="${NEW_DIR_NAME}.bat"

echo "mkdir $NEW_DIR_NAME" > "$BATCH_FILE"
echo "chdir $NEW_DIR_NAME" >> "$BATCH_FILE"

while read -r FILENAME; do
  [[ -n $FILENAME ]] && echo "put $FILENAME" > "$BATCH_FILE"
done < "$FOFN"


