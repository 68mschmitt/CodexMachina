#!/bin/bash
# diffsize.sh - Diff size gate to enforce reviewability
# Returns 0 if diff is within limits, 1 if it exceeds MAX_DIFF_LINES

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

MAX_DIFF_LINES="${MAX_DIFF_LINES:-400}"

echo "Checking diff size (max: $MAX_DIFF_LINES lines)..."

# Get diff stats from git
DIFF_LINES=$(git diff --stat | tail -1 | awk '{print $NF}' | cut -d' ' -f1 | tr -d '+')

if [ -z "$DIFF_LINES" ]; then
  DIFF_LINES=0
fi

echo "Current diff: $DIFF_LINES lines"

if [ "$DIFF_LINES" -gt "$MAX_DIFF_LINES" ]; then
  echo "✗ Diff size ($DIFF_LINES lines) exceeds maximum ($MAX_DIFF_LINES lines)"
  exit 1
fi

echo "✓ Diff size check passed"
exit 0
