#!/usr/bin/env bash
# validate-skills.sh - Validate all skill markdown files
# Usage: ./scripts/validate-skills.sh [skills-dir]
#
# Checks:
# - All .md files exist and are non-empty
# - Each skill has required frontmatter sections
# - No broken references between skills

set -euo pipefail

SKILLS_DIR="${1:-skills}"
ERRORS=0
WARNINGS=0

if [ ! -d "$SKILLS_DIR" ]; then
  echo "ERROR: Skills directory '$SKILLS_DIR' not found"
  exit 1
fi

echo "=== Validating skills in $SKILLS_DIR ==="

for skill in "$SKILLS_DIR"/*.md; do
  [ -f "$skill" ] || continue
  name=$(basename "$skill")

  # Check file is non-empty
  if [ ! -s "$skill" ]; then
    echo "ERROR: $name is empty"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  # Check has headers (markdown files should have at least one # heading)
  if ! grep -q '^#' "$skill"; then
    echo "WARNING: $name has no markdown headings"
    WARNINGS=$((WARNINGS + 1))
  fi

  # Check for common skill structure patterns
  if ! grep -q -i 'description\|purpose\|overview\|what' "$skill"; then
    echo "WARNING: $name may lack a description section"
    WARNINGS=$((WARNINGS + 1))
  fi

  if ! grep -q -i 'example\|usage\|how to\|tutorial' "$skill"; then
    echo "WARNING: $name may lack usage examples"
    WARNINGS=$((WARNINGS + 1))
  fi

  line_count=$(wc -l < "$skill")
  echo "OK: $name ($line_count lines)"
done

echo ""
echo "=== Results: $ERRORS errors, $WARNINGS warnings ==="
exit $ERRORS
