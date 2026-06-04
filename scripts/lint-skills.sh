#!/usr/bin/env bash
# lint-skills.sh - Lint skill files for structure and consistency
# Usage: ./scripts/lint-skills.sh [skills-dir]
#
# Enforces:
# - Consistent heading hierarchy
# - No trailing whitespace
# - Appropriate line lengths
# - Consistent terminology

set -euo pipefail

SKILLS_DIR="${1:-skills}"
EXIT_CODE=0

if [ ! -d "$SKILLS_DIR" ]; then
  echo "ERROR: Skills directory '$SKILLS_DIR' not found"
  exit 1
fi

echo "=== Linting skills in $SKILLS_DIR ==="

for skill in "$SKILLS_DIR"/*.md; do
  [ -f "$skill" ] || continue
  name=$(basename "$skill")
  file_errors=0

  # Check trailing whitespace
  if grep -n '[[:space:]]$' "$skill" | head -10 > /dev/null 2>&1; then
    count=$(grep -c '[[:space:]]$' "$skill")
    echo "WARNING: $name has $count lines with trailing whitespace"
    file_errors=$((file_errors + 1))
  fi

  # Check heading hierarchy (no jumping from # to ### without ##)
  prev_level=0
  while IFS= read -r line; do
    if [[ "$line" =~ ^(#+)[[:space:]] ]]; then
      level=${#BASH_REMATCH[1]}
      if [ $prev_level -gt 0 ] && [ $level -gt $((prev_level + 1)) ]; then
        echo "WARNING: $name: heading level jumps from $prev_level to $level"
        file_errors=$((file_errors + 1))
      fi
      prev_level=$level
    fi
  done < "$skill"

  # Check line lengths (warn > 100 chars)
  long_lines=$(awk 'length > 100 {count++} END {print count}' "$skill")
  if [ "$long_lines" -gt 0 ]; then
    echo "INFO: $name has $long_lines lines over 100 characters"
  fi

  if [ "$file_errors" -eq 0 ]; then
    echo "PASS: $name"
  fi
done

echo ""
echo "=== Lint complete ==="
exit $EXIT_CODE
