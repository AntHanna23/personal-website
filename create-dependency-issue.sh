#!/bin/bash
#
# Script to create a GitHub issue for dependency updates
# 
# Usage:
#   ./create-dependency-issue.sh
#
# Prerequisites:
#   - GitHub CLI (gh) must be installed
#   - You must be authenticated (run: gh auth login)
#

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Creating GitHub Issue: Update All Outdated Versions and Dependencies${NC}"
echo ""

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}Error: GitHub CLI (gh) is not installed.${NC}"
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo -e "${RED}Error: Not authenticated with GitHub CLI.${NC}"
    echo "Please run: gh auth login"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "TASK-UPDATE-ALL-VERSIONS.md" ]; then
    echo -e "${RED}Error: TASK-UPDATE-ALL-VERSIONS.md not found.${NC}"
    echo "Please run this script from the repository root."
    exit 1
fi

# Create the issue
echo "Creating issue..."
gh issue create \
  --repo AntHanna23/personal-website \
  --title "Update All Outdated Versions and Dependencies" \
  --body-file TASK-UPDATE-ALL-VERSIONS.md \
  --label "technical-debt,maintenance,security" \
  && echo -e "${GREEN}✓ Issue created successfully!${NC}" \
  || echo -e "${RED}✗ Failed to create issue.${NC}"

echo ""
echo "View all issues at: https://github.com/AntHanna23/personal-website/issues"
