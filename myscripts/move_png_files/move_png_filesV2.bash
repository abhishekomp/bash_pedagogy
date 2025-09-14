#!/bin/bash

# Usage:
# ./move_pngs.sh <source_folder> <destination_folder> [-m]
# -m : actually move files; default is dry-run

# ----------------------
# Check minimum arguments
# ----------------------
if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <source_folder> <destination_folder> [-m]"
  echo "  -m : actually move files; default is dry-run"
  echo "Example: $0 /path/to/source /path/to/dest -m"
  echo "Example (dry run): ./move_png_files_v2.bash ~/Desktop ~/Desktop/screenshots"
  exit 1
fi

SOURCE=$1
DEST=$2
shift 2  # Remove first two args so $1/$2 are gone

# ----------------------
# Parse -m flag
# ----------------------
MOVE=0
if [[ "$1" == "-m" ]]; then
  MOVE=1
fi

# ----------------------
# Check source folder exists
# ----------------------
if [[ ! -d "$SOURCE" ]]; then
  echo "Error: Source folder does not exist: $SOURCE"
  exit 1
fi

# ----------------------
# Check destination folder exists; create if not
# ----------------------
if [[ ! -d "$DEST" ]]; then
  echo "Destination folder '$DEST' does not exist."
  read -p "Do you want to create it? (y/n): " CREATE
  if [[ "$CREATE" == "y" || "$CREATE" == "Y" ]]; then
    mkdir -p "$DEST"
    echo "Created folder: $DEST"
  else
    echo "Exiting script."
    exit 1
  fi
fi

# ----------------------
# Collect .png files (non-recursive)
# ----------------------
FILES=("$SOURCE"/*.png)

# ----------------------
# Count files safely
# ----------------------
if [[ ! -e "${FILES[0]}" ]]; then
  COUNT=0
else
  COUNT=${#FILES[@]}
fi

echo "Found $COUNT .png file(s) in $SOURCE."

if [[ $COUNT -eq 0 ]]; then
  echo "Nothing to move."
  exit 0
fi

# ----------------------
# Dry run: show conflicts
# ----------------------
if [[ $MOVE -eq 0 ]]; then
  CONFLICTS=0
  for FILE in "${FILES[@]}"; do
    BASENAME=$(basename "$FILE")
    if [[ -e "$DEST/$BASENAME" ]]; then
      ((CONFLICTS++))
    fi
  done

  echo "Dry run: $COUNT files would be moved from $SOURCE to $DEST."
  echo "Run with -m to actually move files."
  if [[ $CONFLICTS -gt 0 ]]; then
    echo "WARNING: $CONFLICTS file(s) would need renaming due to conflicts."
  else
    echo "No conflicts with existing files in destination."
  fi
  exit 0
fi

# ----------------------
# Move files safely (avoid overwriting)
# ----------------------
CONFLICTS=0
for FILE in "${FILES[@]}"; do
  BASENAME=$(basename "$FILE")
  DEST_FILE="$DEST/$BASENAME"

  # If file exists, append a number to the name
  COUNT_SUFFIX=1
  while [[ -e "$DEST_FILE" ]]; do
    NAME="${BASENAME%.*}"
    EXT="${BASENAME##*.}"
    DEST_FILE="$DEST/${NAME}_$COUNT_SUFFIX.$EXT"
    ((COUNT_SUFFIX++))
    ((CONFLICTS++))
  done

  mv "$FILE" "$DEST_FILE"
done

echo "Moved $COUNT .png file(s) from $SOURCE to $DEST safely."
if [[ $CONFLICTS -gt 0 ]]; then
  echo "$CONFLICTS file(s) were renamed to avoid overwriting existing files."
fi