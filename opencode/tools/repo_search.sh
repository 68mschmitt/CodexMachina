#!/bin/bash
# repo_search.sh - Search repository for patterns
# Usage: repo_search.sh <pattern> [file_pattern]

set -e

if [ $# -lt 1 ]; then
  echo "Usage: repo_search.sh <pattern> [file_pattern]"
  exit 1
fi

PATTERN="$1"
FILE_PATTERN="${2:-.}"

echo "Searching for: $PATTERN in $FILE_PATTERN"

# Use ripgrep if available, otherwise fall back to grep
if command -v rg &> /dev/null; then
  rg "$PATTERN" "$FILE_PATTERN" || true
else
  grep -r "$PATTERN" "$FILE_PATTERN" || true
fi

exit 0
