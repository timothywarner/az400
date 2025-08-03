#!/bin/bash
# =============================================================================
# GitHub CLI Demo Script for AZ-400 Course
# Comprehensive GitHub Enterprise Cloud Management Tasks
# Author: Tim Warner - O'Reilly Live Learning Instructor
# =============================================================================

# This script demonstrates 80% of the most common GitHub management tasks
# using GitHub CLI (gh). Each section parallels the Azure DevOps CLI script
# for direct comparison and hybrid learning scenarios.

# =============================================================================
# PREREQUISITES AND SETUP
# =============================================================================

# Install GitHub CLI (if not already installed)
# Windows: winget install --id GitHub.cli
# macOS: brew install gh
# Linux: See https://cli.github.com/manual/installation

# Verify GitHub CLI installation
gh --version
# Expected output: gh version x.x.x (platform/date)

# =============================================================================
# AUTHENTICATION AND INITIAL SETUP
# =============================================================================

# Authenticate with GitHub (interactive browser flow)
# This opens browser for OAuth authentication
gh auth login
# Follow prompts:
# - Choose GitHub.com
# - Choose HTTPS protocol
# - Authenticate via web browser
# - Choose permissions scope

# Verify authentication status
gh auth status
# Shows: Logged in to github.com as <username>

# List available authentication tokens
gh auth token
# Returns: Your personal access token (keep secure!)

# Switch between multiple GitHub accounts (if needed)
# gh auth switch --hostname github.com --user <username>

# =============================================================================
# ORGANIZATION AND REPOSITORY MANAGEMENT
# =============================================================================

echo "=== ORGANIZATION AND REPOSITORY MANAGEMENT ==="

# Set variables for demo (replace with your actual values)
ORG_NAME="your-github-org"
REPO_NAME="az400-demo-project"
TEAM_NAME="devops-engineers"

# List all repositories in an organization
gh repo list $ORG_NAME --limit 50
# Shows: All repos in the organization with basic info

# Create a new repository in the organization
gh repo create $ORG_NAME/$REPO_NAME \
  --description "AZ-400 Demo Project for DevOps Learning" \
  --public \
  --add-readme \
  --gitignore "Node" \
  --license "MIT"
# Creates: New repository with initial files

# Clone the repository locally
gh repo clone $ORG_NAME/$REPO_NAME
cd $REPO_NAME

# View repository information
gh repo view
# Shows: Repository details, description, topics, etc.

# Update repository settings
gh repo edit \
  --description "Updated: AZ-400 Demo Project for DevOps Learning" \
  --add-topic "devops" \
  --add-topic "az400" \
  --add-topic "azure" \
  --enable-issues \
  --enable-projects \
  --enable-wiki
# Updates: Repository metadata and feature toggles

# =============================================================================
# TEAM AND ACCESS MANAGEMENT
# =============================================================================

echo "=== TEAM AND ACCESS MANAGEMENT ==="

# List all teams in the organization
gh api orgs/$ORG_NAME/teams --paginate
# Shows: All teams with their IDs and descriptions

# Create a new team
gh api orgs/$ORG_NAME/teams \
  --method POST \
  --field name="$TEAM_NAME" \
  --field description="DevOps Engineers for AZ-400 Course" \
  --field privacy="closed"
# Creates: New team in the organization

# Add a repository to a team with specific permissions
gh api orgs/$ORG_NAME/teams/$TEAM_NAME/repos/$ORG_NAME/$REPO_NAME \
  --method PUT \
  --field permission="admin"
# Grants: Team admin access to the repository

# List team members
gh api orgs/$ORG_NAME/teams/$TEAM_NAME/members
# Shows: All members of the specified team

# Add a user to a team
gh api orgs/$ORG_NAME/teams/$TEAM_NAME/memberships/username \
  --method PUT \
  --field role="member"
# Adds: User to the team with member role

# List repository collaborators and their permissions
gh api repos/$ORG_NAME/$REPO_NAME/collaborators
# Shows: Direct collaborators and their permission levels

# =============================================================================
# BRANCH PROTECTION AND POLICIES
# =============================================================================

echo "=== BRANCH PROTECTION AND POLICIES ==="

# Create a branch protection rule for main branch
gh api repos/$ORG_NAME/$REPO_NAME/branches/main/protection \
  --method PUT \
  --field required_status_checks='{"strict":true,"contexts":["continuous-integration"]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":2,"dismiss_stale_reviews":true,"require_code_owner_reviews":true}' \
  --field restrictions=null
# Creates: Branch protection requiring 2 reviews and status checks

# View current branch protection settings
gh api repos/$ORG_NAME/$REPO_NAME/branches/main/protection
# Shows: All protection rules for the main branch

# Create a branch protection rule using simpler approach
gh api repos/$ORG_NAME/$REPO_NAME/branches/main/protection \
  --method PUT \
  --input - <<< '{
    "required_status_checks": {
      "strict": true,
      "contexts": ["ci/build", "ci/test"]
    },
    "enforce_admins": true,
    "required_pull_request_reviews": {
      "required_approving_review_count": 1,
      "dismiss_stale_reviews": true,
      "require_code_owner_reviews": false
    },
    "restrictions": null,
    "allow_force_pushes": false,
    "allow_deletions": false
  }'
# Creates: Comprehensive branch protection rule

# List all branches and their protection status
gh api repos/$ORG_NAME/$REPO_NAME/branches --paginate
# Shows: All branches with protection indicators

# =============================================================================
# PULL REQUEST MANAGEMENT
# =============================================================================

echo "=== PULL REQUEST MANAGEMENT ==="

# Create a new branch for demo
git checkout -b feature/demo-feature
echo "# Demo Feature" > demo-feature.md
git add demo-feature.md
git commit -m "Add demo feature documentation"
git push origin feature/demo-feature

# Create a pull request
gh pr create \
  --title "Add demo feature documentation" \
  --body "This PR adds documentation for the demo feature as part of AZ-400 course materials." \
  --base main \
  --head feature/demo-feature \
  --label "documentation" \
  --label "enhancement" \
  --assignee "@me" \
  --reviewer "teammate-username"
# Creates: Pull request with metadata and assignments

# List all pull requests
gh pr list
# Shows: All open pull requests with basic info

# List pull requests with specific filters
gh pr list --state all --limit 20 --author "@me"
# Shows: All PRs authored by you (open and closed)

# View specific pull request details
gh pr view 1
# Shows: Detailed view of PR #1 including comments

# Add a comment to a pull request
gh pr comment 1 --body "This looks good! Please update the documentation version."
# Adds: Comment to PR #1

# Request changes on a pull request
gh pr review 1 --request-changes --body "Please add unit tests for the new feature."
# Requests: Changes with a review comment

# Approve a pull request
gh pr review 1 --approve --body "LGTM! Ready to merge."
# Approves: The pull request with approval comment

# Merge a pull request (squash and merge)
gh pr merge 1 --squash --delete-branch
# Merges: PR with squash strategy and deletes feature branch

# =============================================================================
# ISSUES AND PROJECT MANAGEMENT
# =============================================================================

echo "=== ISSUES AND PROJECT MANAGEMENT ==="

# Create a new issue
gh issue create \
  --title "Implement user authentication system" \
  --body "We need to implement a secure user authentication system with the following requirements:
- JWT token-based authentication
- Password hashing with bcrypt
- Session management
- Role-based access control" \
  --label "enhancement" \
  --label "security" \
  --assignee "@me" \
  --milestone "v1.0"
# Creates: New issue with detailed description and metadata

# List all issues
gh issue list
# Shows: All open issues with basic information

# List issues with specific filters
gh issue list --state all --author "@me" --label "bug"
# Shows: All bug issues authored by you

# View specific issue details
gh issue view 1
# Shows: Detailed view of issue #1 including comments

# Add a comment to an issue
gh issue comment 1 --body "I'll start working on this tomorrow. ETA: 3 days."
# Adds: Comment with progress update

# Close an issue
gh issue close 1 --comment "Authentication system implemented and tested."
# Closes: Issue with a closing comment

# Reopen an issue
gh issue reopen 1 --comment "Reopening due to regression in authentication."
# Reopens: Previously closed issue

# Create issue from template (if templates exist)
gh issue create --template bug_report.md
# Creates: Issue using predefined template

# =============================================================================
# ACTIONS AND WORKFLOWS MANAGEMENT
# =============================================================================

echo "=== ACTIONS AND WORKFLOWS MANAGEMENT ==="

# List all workflow runs
gh run list
# Shows: Recent workflow runs with status

# View specific workflow run details
gh run view 12345
# Shows: Detailed information about run #12345

# Download workflow run logs
gh run download 12345
# Downloads: All logs from the workflow run

# Re-run a failed workflow
gh run rerun 12345
# Triggers: Re-execution of the failed workflow

# Cancel a running workflow
gh run cancel 12345
# Cancels: Currently running workflow

# List all workflows in the repository
gh workflow list
# Shows: All defined workflows and their status

# Disable a workflow
gh workflow disable "CI"
# Disables: The CI workflow from running

# Enable a workflow
gh workflow enable "CI"
# Enables: The previously disabled CI workflow

# Manually trigger a workflow (workflow_dispatch)
gh workflow run "CI" --field environment=staging --field debug=true
# Triggers: Manual workflow run with input parameters

# View workflow definition
gh workflow view "CI"
# Shows: Workflow YAML content and recent runs

# =============================================================================
# SECRETS AND ENVIRONMENT MANAGEMENT
# =============================================================================

echo "=== SECRETS AND ENVIRONMENT MANAGEMENT ==="

# List repository secrets (names only, values are hidden)
gh secret list
# Shows: All repository secret names

# Set a repository secret
echo "super-secret-value" | gh secret set MY_SECRET
# Creates: Repository secret with the provided value

# Set a secret from file
gh secret set DATABASE_PASSWORD < password.txt
# Creates: Secret from file content

# Delete a repository secret
gh secret delete OLD_SECRET
# Removes: The specified repository secret

# List organization secrets (if you have access)
gh secret list --org $ORG_NAME
# Shows: Organization-level secrets

# List environments (requires repository admin access)
gh api repos/$ORG_NAME/$REPO_NAME/environments
# Shows: All defined environments

# Create an environment with protection rules
gh api repos/$ORG_NAME/$REPO_NAME/environments/production \
  --method PUT \
  --field protection_rules='[{"type":"required_reviewers","reviewers":[{"type":"User","id":12345}]}]' \
  --field deployment_branch_policy='{"protected_branches":true,"custom_branch_policies":false}'
# Creates: Production environment with review requirements

# =============================================================================
# RELEASES AND PACKAGES
# =============================================================================

echo "=== RELEASES AND PACKAGES ==="

# Create a new release
gh release create v1.0.0 \
  --title "Version 1.0.0 - Initial Release" \
  --notes "First stable release with the following features:
- User authentication
- Basic CRUD operations
- API documentation
- Docker support" \
  --prerelease=false \
  --generate-notes
# Creates: New release with auto-generated notes

# List all releases
gh release list
# Shows: All releases with version and status

# View specific release details
gh release view v1.0.0
# Shows: Detailed release information

# Upload assets to a release
gh release upload v1.0.0 ./dist/app.zip ./docs/manual.pdf
# Uploads: Files as release assets

# Download release assets
gh release download v1.0.0 --pattern "*.zip"
# Downloads: Specific assets matching pattern

# Delete a release
gh release delete v1.0.0 --yes
# Deletes: The specified release

# =============================================================================
# REPOSITORY INSIGHTS AND ANALYTICS
# =============================================================================

echo "=== REPOSITORY INSIGHTS AND ANALYTICS ==="

# View repository contributors
gh api repos/$ORG_NAME/$REPO_NAME/contributors
# Shows: All contributors with commit counts

# View repository traffic (requires push access)
gh api repos/$ORG_NAME/$REPO_NAME/traffic/views
# Shows: Repository view statistics

# View repository languages
gh api repos/$ORG_NAME/$REPO_NAME/languages
# Shows: Programming languages used in the repository

# View repository topics
gh api repos/$ORG_NAME/$REPO_NAME/topics
# Shows: Repository topics/tags

# Get repository statistics
gh api repos/$ORG_NAME/$REPO_NAME/stats/participation
# Shows: Weekly commit activity statistics

# =============================================================================
# CODESPACES MANAGEMENT
# =============================================================================

echo "=== CODESPACES MANAGEMENT ==="

# List all codespaces
gh codespace list
# Shows: All your active codespaces

# Create a new codespace
gh codespace create --repo $ORG_NAME/$REPO_NAME --branch main --machine basicLinux32gb
# Creates: New codespace for the repository

# Connect to a codespace via SSH
gh codespace ssh --codespace "codespace-name"
# Opens: SSH connection to the codespace

# Port forward from codespace
gh codespace ports forward 3000:3000 --codespace "codespace-name"
# Forwards: Port 3000 from codespace to local machine

# Stop a codespace
gh codespace stop --codespace "codespace-name"
# Stops: The specified codespace

# Delete a codespace
gh codespace delete --codespace "codespace-name"
# Deletes: The specified codespace permanently

# =============================================================================
# ADVANCED GITHUB FEATURES
# =============================================================================

echo "=== ADVANCED GITHUB FEATURES ==="

# Search repositories across GitHub
gh search repos "azure devops" --language=javascript --sort=stars
# Searches: Public repositories matching criteria

# Search issues and pull requests
gh search prs "is:open label:bug author:@me"
# Searches: Open PRs with bug label authored by you

# View GitHub CLI extensions
gh extension list
# Shows: All installed CLI extensions

# Install a GitHub CLI extension
gh extension install cli/gh-copilot
# Installs: GitHub Copilot CLI extension

# Browse repository in web browser
gh browse
# Opens: Current repository in default web browser

# View repository README
gh repo view --web
# Opens: Repository overview page in browser

# =============================================================================
# BULK OPERATIONS AND AUTOMATION
# =============================================================================

echo "=== BULK OPERATIONS AND AUTOMATION ==="

# Close multiple stale issues (example with filtering)
gh issue list --state open --json number,createdAt --jq '.[] | select((.createdAt | fromdateiso8601) < (now - 2592000)) | .number' | \
  xargs -I {} gh issue close {} --comment "Closing stale issue. Please reopen if still relevant."
# Closes: Issues older than 30 days

# Bulk update issue labels
gh issue list --state open --json number --jq '.[].number' | \
  xargs -I {} gh issue edit {} --add-label "needs-triage"
# Adds: "needs-triage" label to all open issues

# Export issues to CSV (using jq for JSON processing)
gh issue list --state all --json number,title,state,createdAt,author --jq -r \
  '["Number","Title","State","Created","Author"], (.[] | [.number,.title,.state,.createdAt,.author.login]) | @csv'
# Exports: All issues to CSV format

# Backup repository settings as JSON
gh api repos/$ORG_NAME/$REPO_NAME > repo-backup.json
# Saves: Repository configuration for backup

# =============================================================================
# GITHUB ENTERPRISE CLOUD SPECIFIC FEATURES
# =============================================================================

echo "=== GITHUB ENTERPRISE CLOUD SPECIFIC FEATURES ==="

# List SAML SSO organizations (Enterprise Cloud)
gh auth status --show-token | grep -i enterprise
# Shows: Enterprise Cloud authentication status

# View enterprise audit log (requires enterprise admin)
gh api enterprises/your-enterprise/audit-log
# Shows: Enterprise audit events

# List all organizations in enterprise
gh api enterprises/your-enterprise/organizations
# Shows: All organizations under enterprise

# View enterprise billing information (requires permissions)
gh api enterprises/your-enterprise/billing/seats
# Shows: Seat usage and billing information

# Manage enterprise security policies
gh api enterprises/your-enterprise/code_security_configurations
# Shows: Security policies and configurations

# =============================================================================
# CLEANUP AND BEST PRACTICES
# =============================================================================

echo "=== CLEANUP AND BEST PRACTICES ==="

# List all personal access tokens (requires web interface)
echo "Personal Access Tokens should be managed via GitHub web interface"
echo "Navigate to: Settings > Developer settings > Personal access tokens"

# View current rate limit status
gh api rate_limit
# Shows: Current API rate limit usage

# Clear GitHub CLI cache
gh cache clear
# Clears: Local CLI cache and stored data

# Update GitHub CLI to latest version
gh version --upgrade
# Updates: CLI to the latest available version

# =============================================================================
# SCRIPT COMPLETION AND SUMMARY
# =============================================================================

echo "=== DEMO SCRIPT COMPLETED ==="
echo "GitHub CLI Demo Tasks Completed:"
echo " Authentication and setup"
echo " Repository management"
echo " Team and access control"
echo " Branch protection policies"
echo " Pull request workflows"
echo " Issues and project management"
echo " Actions and workflows"
echo " Secrets and environments"
echo " Releases and packages"
echo " Analytics and insights"
echo " Codespaces management"
echo " Advanced features"
echo " Enterprise Cloud features"

echo ""
echo "Next Steps:"
echo "1. Compare with az-cli-demo-script.sh for platform differences"
echo "2. Practice these commands in your own GitHub organization"
echo "3. Customize variables at the top of the script for your environment"
echo "4. Use these patterns in your AZ-400 course demonstrations"

echo ""
echo "For AZ-400 Exam Success:"
echo "- Focus on parallel features between GitHub and Azure DevOps"
echo "- Understand when to use each platform"
echo "- Practice hybrid scenarios using both platforms"
echo "- Remember the new unified licensing model"

# =============================================================================#
# END OF SCRIPT
# =============================================================================