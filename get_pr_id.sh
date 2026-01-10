#!/bin/bash
# Script to find and display the PR ID for bug-fix-revert branch

echo "Searching for PR from bug-fix-revert branch..."
PR_ID=$(curl -s 'https://api.github.com/repos/ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub/pulls?state=all&per_page=100' | jq -r '.[] | select(.head.ref == "bug-fix-revert" and .head.user.login == "HarshaS18") | .number' | head -1)

if [ -n "$PR_ID" ] && [ "$PR_ID" != "null" ]; then
    echo "Found PR ID: $PR_ID"
    echo ""
    echo "Updating bug-fix-revert file..."
    sed -i '' "s/<Pull-Request-ID>/$PR_ID/g" bug-fix-revert
    echo "File updated!"
    cat bug-fix-revert
else
    echo "PR not found. Please provide the PR ID manually."
    echo "You can find it in the PR URL on GitHub."
fi
