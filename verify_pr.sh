#!/bin/bash
# Script to verify pull request and save output to bug-fix-revert file

# Replace <Pull-Request-ID> with your actual PR number
# You can find the PR ID in the URL: https://github.com/ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub/pull/<Pull-Request-ID>

PR_ID="${1:-<Pull-Request-ID>}"

if [ "$PR_ID" = "<Pull-Request-ID>" ]; then
    echo "Usage: ./verify_pr.sh <Pull-Request-ID>"
    echo ""
    echo "Example: ./verify_pr.sh 123"
    echo ""
    echo "To find your PR ID:"
    echo "1. Go to your pull request on GitHub"
    echo "2. Look at the URL: https://github.com/ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub/pull/<PR-ID>"
    echo "3. The number at the end is your PR ID"
    exit 1
fi

echo "Verifying pull request #$PR_ID..."
echo ""

# Run the curl command and save to bug-fix-revert file
{
    echo "Command:"
    echo "curl -s https://api.github.com/repos/ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub/pulls/$PR_ID | jq -r '.head.repo.clone_url'"
    echo ""
    echo "Output:"
    curl -s https://api.github.com/repos/ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub/pulls/$PR_ID | jq -r '.head.repo.clone_url'
} > bug-fix-revert

echo "Output saved to bug-fix-revert file:"
cat bug-fix-revert
