#!/bin/bash
# http_request.sh - Make HTTP requests
# Usage: http_request.sh <method> <url> [data]

set -e

if [ $# -lt 2 ]; then
  echo "Usage: http_request.sh <method> <url> [data]"
  exit 1
fi

METHOD="$1"
URL="$2"
DATA="${3:-}"

echo "Making $METHOD request to $URL"

if command -v curl &> /dev/null; then
  if [ -z "$DATA" ]; then
    curl -s -X "$METHOD" "$URL" || true
  else
    curl -s -X "$METHOD" "$URL" -H "Content-Type: application/json" -d "$DATA" || true
  fi
else
  echo "✗ curl not found"
  exit 1
fi

exit 0
