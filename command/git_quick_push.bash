#!/bin/zsh


# Check if an argument was provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 \"commit message\""
  exit 1
fi

# Sanitize the commit message
commit_msg="$1"

# Escape double quotes and backslashes
sanitized_msg=$(printf '%s' "$commit_msg" | sed 's/\\/\\\\/g; s/"/\\"/g')

# Git operations
git add --all
git commit -m "$sanitized_msg"
git push

