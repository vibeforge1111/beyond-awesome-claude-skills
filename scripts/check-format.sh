#!/usr/bin/env bash
# check-format.sh - Check skill file formatting consistency
# Usage: ./scripts/check-format.sh [skills-dir]
#
# Verifies:
# - Consistent line endings (LF not CRLF)
# - No tabs where spaces expected
# - All files end with newline
# - Consistent code block formatting

set -euo pipefail

SKILLS_DIR="${1:-skills}"
EXIT_CODE=0

if [ ! -d "$SKILLS_DIR" ]; then
  echo "ERROR: Skills directory '$SKILLS_DIR' not found"
  exit 1
fi

echo "=== Checking formatting in $SKILLS_DIR ==="

for skill in "$SKILLS_DIR"/*.md; do
  [ -f "$skill" ] || continue
  name=$(basename "$skill")

  # Check CRLF line endings
  if grep -l $'\r' "$skill" > /dev/null 2>&1; then
    echo "ISSUE: $name has CRLF line endings"
    EXIT_CODE=1
  fi

  # Check file ends with newline
  if [ -s "$skill" ] && [ "$(tail -c 1 "$skill" | wc -l)" -eq 0 ]; then
    echo "ISSUE: $name does not end with a newline"
    EXIT_CODE=1
  fi

  # Check for tab characters
  if grep -P '\t' "$skill" > /dev/null 2>&1; then
    count=$(grep -cP '\t' "$skill")
    echo "INFO: $name has $count tab characters (consider using spaces)"
  fi

  # Check code block consistency
  open_blocks=$(grep -c '^```' "$skill" 2>/dev/null || echo 0)
  if [ $((open_blocks % 2)) -ne 0 ]; then
    echo "ISSUE: $name has unbalanced code blocks (odd number of ``` markers)"
    EXIT_CODE=1
  fi

  echo "OK: $name"
done

echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "=== All format checks passed ==="
else
  echo "=== Some format issues found ==="
fi
exit $EXIT_CODE
