#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CSS_OPTS=()
MD_FILE=""

for arg in "$@"; do
  case "$arg" in
    -p|--page-break) CSS_OPTS=(--css "h2 ~ h2 { break-before: page; page-break-before: always; }") ;;
    *) MD_FILE="$arg" ;;
  esac
done

if [ -z "$MD_FILE" ] || [ ! -f "$MD_FILE" ]; then
  echo "Usage: pdf.sh [-p] <markdown-file.md>"
  exit 1
fi

md-to-pdf "$MD_FILE" \
  --stylesheet "$SCRIPT_DIR/styles.css" \
  "${CSS_OPTS[@]}" \
  --pdf-options '{ "format": "A4", "printBackground": true, "margin": { "top": "18mm", "bottom": "18mm", "left": "18mm", "right": "18mm" } }'
