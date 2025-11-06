#!/bin/bash
# repo_map.sh - Generate map of repository structure
# Usage: repo_map.sh [max_depth]

set -e

MAX_DEPTH="${1:-3}"

echo "Repository structure (max depth: $MAX_DEPTH):"

# Use tree if available, otherwise use find
if command -v tree &> /dev/null; then
  tree -L "$MAX_DEPTH" -I 'node_modules|.git|__pycache__|*.egg-info' .
else
  find . -maxdepth "$MAX_DEPTH" -type d \
    ! -path '*/.*' \
    ! -path '*node_modules*' \
    ! -path '*__pycache__*' \
    ! -path '*.egg-info*' \
    -print | sed 's|[^/]*/| |g'
fi

exit 0
