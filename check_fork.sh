#!/bin/bash
# Script to check fork status and provide guidance

USERNAME="HarshaS18"
REPO_NAME="mcino-Introduction-to-Git-and-GitHub"
PARENT_REPO="ibm-developer-skills-network/mcino-Introduction-to-Git-and-GitHub"

echo "Checking repository fork status..."
echo "=================================="
echo ""

# Check if repository exists and get full details
echo "1. Checking repository details:"
REPO_DATA=$(curl -s https://api.github.com/repos/${USERNAME}/${REPO_NAME})
echo "$REPO_DATA" | jq '{name, full_name, private, fork, parent: .parent.full_name}'
echo ""

# Check parent relationship
echo "2. Checking parent repository (fork relationship):"
PARENT_URL=$(echo "$REPO_DATA" | jq -r '.parent.clone_url')
if [ "$PARENT_URL" = "null" ] || [ -z "$PARENT_URL" ]; then
    echo "❌ ERROR: Repository is NOT recognized as a fork!"
    echo ""
    echo "The repository does not have a parent relationship."
    echo ""
    echo "SOLUTION:"
    echo "You need to properly fork the repository on GitHub:"
    echo ""
    echo "1. Go to: https://github.com/${PARENT_REPO}"
    echo "2. Click the 'Fork' button in the top-right corner"
    echo "3. Make sure to fork to your account (${USERNAME})"
    echo "4. If you already have a repository with this name, you may need to:"
    echo "   - Delete your existing repository: https://github.com/${USERNAME}/${REPO_NAME}/settings"
    echo "   - Then fork the original repository again"
    echo ""
    echo "5. After forking, verify the repository is PUBLIC:"
    echo "   - Go to Settings > General > Danger Zone > Change repository visibility"
    echo "   - Make sure it's set to Public"
    echo ""
    echo "6. Then run this command again to verify:"
    echo "   curl -s https://api.github.com/repos/${USERNAME}/${REPO_NAME} | jq -r '.parent.clone_url'"
    echo ""
    echo "Expected output should be:"
    echo "   https://github.com/${PARENT_REPO}.git"
else
    echo "✅ SUCCESS: Repository is properly forked!"
    echo "Parent repository: $PARENT_URL"
    echo ""
    echo "Verifying parent matches expected repository..."
    if [[ "$PARENT_URL" == *"${PARENT_REPO}"* ]]; then
        echo "✅ Parent repository matches expected: ${PARENT_REPO}"
    else
        echo "⚠️  WARNING: Parent repository does not match expected!"
        echo "   Expected: ${PARENT_REPO}"
        echo "   Found: $PARENT_URL"
    fi
fi

echo ""
echo "3. Checking repository visibility:"
IS_PRIVATE=$(echo "$REPO_DATA" | jq -r '.private')
if [ "$IS_PRIVATE" = "true" ]; then
    echo "❌ ERROR: Repository is PRIVATE!"
    echo "   The repository must be PUBLIC for the verification to work."
    echo "   Go to: https://github.com/${USERNAME}/${REPO_NAME}/settings"
    echo "   Settings > General > Danger Zone > Change repository visibility > Make public"
else
    echo "✅ Repository is PUBLIC"
fi
