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
  echo "Example (dry run): ./move_png_files.bash ~/Desktop ~/Desktop/screenshots"
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
# Check folders exist
# ----------------------
if [[ ! -d "$SOURCE" ]]; then
  echo "Error: Source folder does not exist: $SOURCE"
  exit 1
fi

if [[ ! -d "$DEST" ]]; then
  echo "Error: Destination folder does not exist: $DEST"
  exit 1
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
# Dry run vs move
# ----------------------
if [[ $MOVE -eq 0 ]]; then
  echo "Dry run: $COUNT files would be moved from $SOURCE to $DEST."
  exit 0
fi

# ----------------------
# Perform move
# ----------------------
mv "${FILES[@]}" "$DEST"/
echo "Moved $COUNT .png file(s) from $SOURCE to $DEST."
