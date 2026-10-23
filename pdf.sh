#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MD_FILE="$1"

if [ -z "$MD_FILE" ] || [ ! -f "$MD_FILE" ]; then
  echo "Usage: pdf.sh <markdown-file.md>"
  exit 1
fi

md-to-pdf "$MD_FILE" \
  --stylesheet "$SCRIPT_DIR/styles.css" \
  --pdf-options '{ "format": "A4", "printBackground": true, "margin": { "top": "18mm", "bottom": "18mm", "left": "18mm", "right": "18mm" } }'
