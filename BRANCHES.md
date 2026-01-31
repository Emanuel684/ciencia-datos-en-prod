# Branch Structure

This repository is configured to have three main branches:

## Branches

1. **developer** - Development branch for ongoing work
2. **certification** - Branch for certification and testing
3. **master** - Main/production branch

## Creating the Branches

### Option 1: Using GitHub Actions (Automated)

A GitHub Actions workflow has been configured to automatically create these branches. The workflow will run automatically when changes are pushed to the `copilot/create-new-repo-branches` branch, or it can be triggered manually:

1. Go to the Actions tab in the GitHub repository
2. Select "Create Repository Branches" workflow
3. Click "Run workflow"
4. Select the branch and click "Run workflow"

### Option 2: Using the Shell Script (Manual)

If you have push access to the repository, you can run the provided script:

```bash
./create-branches.sh
```

This script will:
- Create the three branches locally if they don't exist
- Push them to the remote repository
- Verify the branches were created successfully

### Option 3: Manual Git Commands

You can also create the branches manually:

```bash
# Create and push developer branch
git checkout -b developer
git push -u origin developer

# Create and push certification branch
git checkout -b certification
git push -u origin certification

# Create and push master branch
git checkout -b master
git push -u origin master
```

## Verifying Branches

To verify that all branches exist on the remote repository:

```bash
git ls-remote --heads origin
```

You should see `developer`, `certification`, and `master` listed among the branches.
