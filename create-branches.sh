#!/bin/bash

# Script to create and push the required branches
# This script should be run by someone with push access to the repository

set -e

echo "Creating repository branches..."

# Array of branches to create
branches=("developer" "certification" "master")

# Get the current branch to return to it later
current_branch=$(git branch --show-current)

# Create and push each branch
for branch in "${branches[@]}"; do
    echo "Processing branch: $branch"
    
    # Check if branch exists locally
    if git show-ref --verify --quiet refs/heads/$branch; then
        echo "  - Branch $branch already exists locally"
        git checkout $branch
    else
        echo "  - Creating branch $branch"
        git checkout -b $branch
    fi
    
    # Push the branch to remote
    if git push -u origin $branch 2>&1 | grep -q "up-to-date\|new branch"; then
        echo "  - Branch $branch pushed successfully"
    else
        echo "  - Note: Branch $branch may already exist on remote"
    fi
done

# Return to original branch
git checkout $current_branch

echo ""
echo "Branch creation complete!"
echo "Verifying remote branches:"
git ls-remote --heads origin | grep -E "(developer|certification|master)"
