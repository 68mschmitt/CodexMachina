#!/bin/bash
# adr_required.sh - ADR gate to require Architecture Decision Records
# Returns 0 if ADR is created when needed, 1 if required ADR is missing

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "Checking for required ADRs..."

# Get list of files changed in this PR/branch
CHANGED_FILES=$(git diff --name-only origin/main...HEAD 2>/dev/null || git diff --name-only HEAD~1..HEAD)

# Directories that typically require ADRs
ADR_REQUIRED_DIRS=("api/*" "schemas/*" "core/*" "architecture/*")

NEEDS_ADR=false
for pattern in "${ADR_REQUIRED_DIRS[@]}"; do
  for file in $CHANGED_FILES; do
    if [[ $file == $pattern ]]; then
      NEEDS_ADR=true
      break 2
    fi
  done
done

if $NEEDS_ADR; then
  # Check if ADR was created
  ADR_FILES=$(git diff --name-only origin/main...HEAD 2>/dev/null | grep -E "ADR-[0-9]+.*\.md" || true)
  
  if [ -z "$ADR_FILES" ]; then
    echo "✗ Changes to sensitive paths detected, but no ADR found"
    echo "Please create an ADR for your architectural decisions"
    exit 1
  fi
  
  echo "✓ ADR requirement satisfied"
else
  echo "✓ No ADR required for these changes"
fi

exit 0
