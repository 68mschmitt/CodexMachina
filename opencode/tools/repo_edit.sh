#!/bin/bash
# repo_edit.sh - Safely edit repository files with validation
# Usage: repo_edit.sh <file_path> [--check]

set -e

if [ $# -lt 1 ]; then
  echo "Usage: repo_edit.sh <file_path> [--check]"
  exit 1
fi

FILE_PATH="$1"
CHECK_MODE="${2:---edit}"

# Validate file path for safety
if [[ "$FILE_PATH" == *"/.git/"* ]] || [[ "$FILE_PATH" == *"/secrets/"* ]]; then
  echo "✗ Cannot edit sensitive paths"
  exit 1
fi

if [ ! -f "$FILE_PATH" ]; then
  echo "✗ File not found: $FILE_PATH"
  exit 1
fi

if [ "$CHECK_MODE" == "--check" ]; then
  echo "Would edit: $FILE_PATH"
  wc -l "$FILE_PATH"
  exit 0
fi

# In real usage, this would handle actual edits
# For now, just validate
echo "✓ File available for editing: $FILE_PATH"

exit 0
