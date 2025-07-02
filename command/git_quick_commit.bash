#!/bin/zsh


# Default flag values
DO_PUSH=0

# Usage function
usage() {
  echo "Usage: $0 [-p] \"commit message\""
  echo ""
  echo "Description:"
  echo "  Adds all changes, commits with the given message."
  echo ""
  echo "Options:"
  echo "  -p       Push to remote after commiting changes"
  exit 1
}

# Parse all arguments
for arg in "$@"; do
  if [[ "$arg" == -* ]]; then
    if [[ "$arg" == "-p" ]]; then
	    DO_PUSH=$(( ! $DO_PUSH ))
    else
      echo "Unknown option: $arg"
      usage
    fi
  else
    if [[ -n "$COMMIT_MSG" ]]; then
      echo "Error: Only one commit message allowed."
      usage
    fi
    COMMIT_MSG="$arg"
  fi
done

# Check if commit message is present
if [[ -z "$COMMIT_MSG" ]]; then
  echo "Error: Commit message is required."
  usage
fi

# Sanitize the commit message
sanitized_msg=$(printf '%s' "$COMMIT_MSG" | sed 's/\\/\\\\/g; s/"/\\"/g')

# Git operations
git add --all
git commit -m "$sanitized_msg"
[ $DO_PUSH ] && git push

