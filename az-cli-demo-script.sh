#!/bin/bash
# =============================================================================
# Azure CLI + Azure DevOps Demo Script for AZ-400 Course
# Comprehensive Azure DevOps Management Tasks
# Author: Tim Warner - O'Reilly Live Learning Instructor
# =============================================================================

# This script demonstrates 80% of the most common Azure DevOps management tasks
# using Azure CLI with Azure DevOps extension. Each section parallels the GitHub CLI script
# for direct comparison and hybrid learning scenarios.

# =============================================================================
# PREREQUISITES AND SETUP
# =============================================================================

# Install Azure CLI (if not already installed)
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Verify Azure CLI installation
az --version
# Expected output: azure-cli version and components

# Install Azure DevOps CLI extension (REQUIRED for Azure DevOps commands)
az extension add --name azure-devops
# Installs: Azure DevOps extension for az cli

# Update Azure DevOps extension to latest version
az extension update --name azure-devops
# Updates: Extension to the latest available version

# List all installed extensions to verify
az extension list --output table
# Shows: All installed extensions including azure-devops

# =============================================================================
# AUTHENTICATION AND INITIAL SETUP
# =============================================================================

# Sign in to Azure (interactive browser flow)
az login
# Opens: Browser for Azure authentication
# Follow prompts to authenticate with your Azure account

# List available subscriptions
az account list --output table
# Shows: All subscriptions you have access to

# Set active subscription (replace with your subscription ID)
az account set --subscription "your-subscription-id"
# Sets: Active subscription for subsequent commands

# Authenticate with Azure DevOps (Personal Access Token)
# Create PAT at: https://dev.azure.com/[organization]/_usersSettings/tokens
echo "your-personal-access-token" | az devops login
# Authenticates: With Azure DevOps using Personal Access Token

# Configure default Azure DevOps organization and project
az devops configure --defaults organization=https://dev.azure.com/your-org project=your-project
# Sets: Default organization and project for all subsequent commands

# Verify authentication and configuration
az devops project list --output table
# Shows: All projects in your organization

# =============================================================================
# ORGANIZATION AND PROJECT MANAGEMENT
# =============================================================================

echo "=== ORGANIZATION AND PROJECT MANAGEMENT ==="

# Set variables for demo (replace with your actual values)
ORG_NAME="your-org"
PROJECT_NAME="AZ400-Demo-Project"
TEAM_NAME="DevOps-Engineers"
REPO_NAME="az400-demo-repo"

# List all projects in organization
az devops project list --org https://dev.azure.com/$ORG_NAME --output table
# Shows: All projects with basic information

# Create a new project
az devops project create \
  --name "$PROJECT_NAME" \
  --description "AZ-400 Demo Project for DevOps Learning" \
  --visibility private \
  --process "Agile" \
  --source-control git \
  --org https://dev.azure.com/$ORG_NAME
# Creates: New project with specified template and settings

# Show project details
az devops project show \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: Detailed project information

# Update project description
az devops project update \
  --project "$PROJECT_NAME" \
  --description "Updated: AZ-400 Demo Project for DevOps Learning and Certification" \
  --org https://dev.azure.com/$ORG_NAME
# Updates: Project metadata

# =============================================================================
# REPOSITORY MANAGEMENT
# =============================================================================

echo "=== REPOSITORY MANAGEMENT ==="

# List all repositories in the project
az repos list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All Git repositories in the project

# Create a new Git repository
az repos create \
  --name "$REPO_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: New Git repository in the project

# Show repository details
az repos show \
  --repository "$REPO_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Repository details including clone URLs

# Clone the repository locally
git clone https://dev.azure.com/$ORG_NAME/$PROJECT_NAME/_git/$REPO_NAME
cd $REPO_NAME

# Initialize repository with README
echo "# $PROJECT_NAME" > README.md
echo "AZ-400 Demo Repository for DevOps Learning" >> README.md
git add README.md
git commit -m "Initial commit with README"
git push origin main

# =============================================================================
# TEAM AND ACCESS MANAGEMENT
# =============================================================================

echo "=== TEAM AND ACCESS MANAGEMENT ==="

# List all teams in the project
az devops team list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All teams in the project

# Create a new team
az devops team create \
  --name "$TEAM_NAME" \
  --description "DevOps Engineers for AZ-400 Course" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: New team in the project

# Show team details
az devops team show \
  --team "$TEAM_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Team information and members

# List team members
az devops team list-member \
  --team "$TEAM_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All members of the specified team

# Add a user to the team
az devops team add-member \
  --team "$TEAM_NAME" \
  --user "user@example.com" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Adds: User to the team

# List project permissions for a user
az devops security permission list \
  --subject "user@example.com" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: User permissions across the project

# =============================================================================
# BRANCH POLICIES AND PROTECTION
# =============================================================================

echo "=== BRANCH POLICIES AND PROTECTION ==="

# List all branch policies for the repository
az repos policy list \
  --repository-id $(az repos show --repository "$REPO_NAME" --project "$PROJECT_NAME" --org https://dev.azure.com/$ORG_NAME --query "id" -o tsv) \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All branch policies configured

# Create a minimum reviewers policy for main branch
az repos policy required-reviewer create \
  --blocking true \
  --enabled true \
  --minimum-reviewer-count 2 \
  --creator-vote-counts false \
  --reset-on-source-push true \
  --repository-id $(az repos show --repository "$REPO_NAME" --project "$PROJECT_NAME" --org https://dev.azure.com/$ORG_NAME --query "id" -o tsv) \
  --branch "refs/heads/main" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Policy requiring 2 reviewers for main branch

# Create a build validation policy (requires build definition)
# First, you would need a build pipeline configured
# az repos policy build create \
#   --blocking true \
#   --enabled true \
#   --build-definition-id <build-definition-id> \
#   --queue-on-source-update-only true \
#   --manual-queue-only false \
#   --valid-duration 720 \
#   --repository-id $(az repos show --repository "$REPO_NAME" --project "$PROJECT_NAME" --org https://dev.azure.com/$ORG_NAME --query "id" -o tsv) \
#   --branch "refs/heads/main" \
#   --project "$PROJECT_NAME" \
#   --org https://dev.azure.com/$ORG_NAME
# Creates: Build validation policy for main branch

# Create a comment requirements policy
az repos policy comment-required create \
  --blocking true \
  --enabled true \
  --repository-id $(az repos show --repository "$REPO_NAME" --project "$PROJECT_NAME" --org https://dev.azure.com/$ORG_NAME --query "id" -o tsv) \
  --branch "refs/heads/main" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Policy requiring comment resolution

# List all branches in the repository
az repos ref list \
  --repository "$REPO_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All branches and their latest commits

# =============================================================================
# PULL REQUEST MANAGEMENT
# =============================================================================

echo "=== PULL REQUEST MANAGEMENT ==="

# Create a new branch for demo
git checkout -b feature/demo-feature
echo "# Demo Feature" > demo-feature.md
echo "This is a demo feature for AZ-400 course." >> demo-feature.md
git add demo-feature.md
git commit -m "Add demo feature documentation"
git push origin feature/demo-feature

# Create a pull request
az repos pr create \
  --title "Add demo feature documentation" \
  --description "This PR adds documentation for the demo feature as part of AZ-400 course materials." \
  --source-branch "feature/demo-feature" \
  --target-branch "main" \
  --repository "$REPO_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --work-items "123" \
  --reviewers "reviewer@example.com"
# Creates: Pull request with metadata and reviewers

# List all pull requests
az repos pr list \
  --repository "$REPO_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All pull requests with basic info

# List pull requests with specific filters
az repos pr list \
  --repository "$REPO_NAME" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --status "active" \
  --creator "user@example.com" \
  --output table
# Shows: Active PRs created by specific user

# Show specific pull request details
az repos pr show \
  --id 1 \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Detailed view of PR #1

# Add reviewers to a pull request
az repos pr reviewer add \
  --id 1 \
  --reviewers "additional-reviewer@example.com" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Adds: Reviewer to existing pull request

# Create a review with vote
az repos pr set-vote \
  --id 1 \
  --vote "approve" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Votes: Approve on the pull request

# Complete (merge) a pull request
az repos pr update \
  --id 1 \
  --status "completed" \
  --merge-commit-message "Merge feature/demo-feature into main" \
  --delete-source-branch true \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Completes: PR and deletes source branch

# =============================================================================
# WORK ITEMS AND PROJECT MANAGEMENT
# =============================================================================

echo "=== WORK ITEMS AND PROJECT MANAGEMENT ==="

# List work item types available in the project
az boards work-item-type list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: Available work item types (User Story, Bug, Task, etc.)

# Create a new user story
az boards work-item create \
  --title "Implement user authentication system" \
  --type "User Story" \
  --description "As a user, I want to securely authenticate so that I can access the application features." \
  --assigned-to "developer@example.com" \
  --area "Authentication" \
  --iteration "Sprint 1" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: New user story work item

# Create a task linked to the user story
az boards work-item create \
  --title "Create login API endpoint" \
  --type "Task" \
  --description "Implement REST API endpoint for user login with JWT token generation." \
  --assigned-to "developer@example.com" \
  --parent 1 \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Task as child of user story

# Create a bug work item
az boards work-item create \
  --title "Login button not responsive on mobile" \
  --type "Bug" \
  --description "The login button doesn't respond to touch events on mobile devices." \
  --assigned-to "tester@example.com" \
  --priority 2 \
  --severity "2 - High" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Bug work item with priority and severity

# List work items with query
az boards query \
  --wiql "SELECT [System.Id], [System.Title], [System.State] FROM WorkItems WHERE [System.WorkItemType] = 'User Story'" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: User stories using WIQL query

# Show specific work item details
az boards work-item show \
  --id 1 \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Detailed work item information

# Update a work item
az boards work-item update \
  --id 1 \
  --state "Active" \
  --assigned-to "new-developer@example.com" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Updates: Work item state and assignment

# Add a comment to work item
az boards work-item update \
  --id 1 \
  --discussion "Started working on this user story. ETA: 3 days." \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Adds: Comment to work item discussion

# =============================================================================
# BUILD PIPELINES MANAGEMENT
# =============================================================================

echo "=== BUILD PIPELINES MANAGEMENT ==="

# List all build definitions
az pipelines list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All build pipelines in the project

# Create a build pipeline from YAML file
az pipelines create \
  --name "CI-Build-Pipeline" \
  --description "Continuous Integration build pipeline" \
  --repository "$REPO_NAME" \
  --repository-type "tfsgit" \
  --yaml-path "/azure-pipelines.yml" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Build pipeline from YAML in repository

# Show build definition details
az pipelines show \
  --name "CI-Build-Pipeline" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Build pipeline configuration

# Queue a new build
az pipelines run \
  --name "CI-Build-Pipeline" \
  --branch "main" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Triggers: New build run

# List build runs
az pipelines runs list \
  --pipeline-ids $(az pipelines show --name "CI-Build-Pipeline" --project "$PROJECT_NAME" --org https://dev.azure.com/$ORG_NAME --query "id" -o tsv) \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: Recent build runs

# Show specific build run details
az pipelines runs show \
  --id 1 \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Detailed build run information

# Download build artifacts
az pipelines runs artifact download \
  --run-id 1 \
  --artifact-name "drop" \
  --path "./artifacts" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Downloads: Build artifacts to local directory

# Update build definition
az pipelines update \
  --name "CI-Build-Pipeline" \
  --description "Updated: Continuous Integration build pipeline" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Updates: Build pipeline metadata

# =============================================================================
# RELEASE PIPELINES MANAGEMENT
# =============================================================================

echo "=== RELEASE PIPELINES MANAGEMENT ==="

# List all release definitions
az pipelines release list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All release pipelines in the project

# Create a release definition (requires JSON definition file)
# This is typically done via the web interface or by importing JSON
echo "Release pipelines are best created via Azure DevOps web interface"
echo "Use: Project Settings > Pipelines > Releases > New pipeline"

# List releases for a specific definition
# az pipelines release list-releases \
#   --definition-id 1 \
#   --project "$PROJECT_NAME" \
#   --org https://dev.azure.com/$ORG_NAME \
#   --output table
# Shows: All releases for the definition

# Create a new release
# az pipelines release create \
#   --definition-id 1 \
#   --description "Manual release for demo" \
#   --project "$PROJECT_NAME" \
#   --org https://dev.azure.com/$ORG_NAME
# Creates: New release from definition

# =============================================================================
# ENVIRONMENTS AND DEPLOYMENT MANAGEMENT
# =============================================================================

echo "=== ENVIRONMENTS AND DEPLOYMENT MANAGEMENT ==="

# List all environments
az pipelines environment list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All deployment environments

# Create a new environment
az pipelines environment create \
  --name "Development" \
  --description "Development environment for testing" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: New deployment environment

# Create staging environment
az pipelines environment create \
  --name "Staging" \
  --description "Staging environment for pre-production testing" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Staging environment

# Create production environment
az pipelines environment create \
  --name "Production" \
  --description "Production environment" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Production environment

# Show environment details
az pipelines environment show \
  --name "Production" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Environment configuration and resources

# =============================================================================
# VARIABLE GROUPS AND SECRETS MANAGEMENT
# =============================================================================

echo "=== VARIABLE GROUPS AND SECRETS MANAGEMENT ==="

# List all variable groups
az pipelines variable-group list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All variable groups in the project

# Create a variable group
az pipelines variable-group create \
  --name "Development-Variables" \
  --description "Variables for development environment" \
  --variables API_URL="https://dev-api.example.com" DATABASE_NAME="devdb" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Variable group with development settings

# Create a variable group linked to Azure Key Vault
az pipelines variable-group create \
  --name "Production-Secrets" \
  --description "Production secrets from Key Vault" \
  --key-vault-name "your-keyvault" \
  --key-vault-secrets "DatabasePassword" "ApiKey" \
  --authorize true \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Variable group linked to Azure Key Vault

# Show variable group details
az pipelines variable-group show \
  --group-id 1 \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Variable group configuration and variables

# Update variable group
az pipelines variable-group update \
  --group-id 1 \
  --description "Updated: Variables for development environment" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Updates: Variable group metadata

# Add variable to group
az pipelines variable-group variable create \
  --group-id 1 \
  --name "NEW_SETTING" \
  --value "new-value" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Adds: New variable to existing group

# =============================================================================
# SERVICE CONNECTIONS MANAGEMENT
# =============================================================================

echo "=== SERVICE CONNECTIONS MANAGEMENT ==="

# List all service endpoints
az devops service-endpoint list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All service connections in the project

# Create Azure Resource Manager service connection
az devops service-endpoint azurerm create \
  --azure-rm-service-principal-id "your-service-principal-id" \
  --azure-rm-subscription-id "your-subscription-id" \
  --azure-rm-subscription-name "Your Subscription Name" \
  --azure-rm-tenant-id "your-tenant-id" \
  --name "Azure-Production" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Azure Resource Manager service connection

# Create GitHub service connection
az devops service-endpoint github create \
  --github-url "https://github.com" \
  --name "GitHub-Connection" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: GitHub service connection

# Show service endpoint details
az devops service-endpoint show \
  --id "service-endpoint-id" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Shows: Service connection configuration

# =============================================================================
# ARTIFACTS AND PACKAGE MANAGEMENT
# =============================================================================

echo "=== ARTIFACTS AND PACKAGE MANAGEMENT ==="

# List all feeds in the organization
az artifacts universal list \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All artifact feeds

# Note: Azure Artifacts commands require additional setup and specific scenarios
# For comprehensive package management, use the Azure Artifacts web interface
# or specific package managers (npm, NuGet, Maven, etc.) with Azure Artifacts URLs

echo "Azure Artifacts management typically involves:"
echo "1. Creating feeds via web interface"
echo "2. Configuring package managers to use Azure Artifacts URLs"
echo "3. Publishing packages using standard tools (npm publish, dotnet push, etc.)"
echo "4. Managing feed permissions and retention policies"

# =============================================================================
# TEST MANAGEMENT
# =============================================================================

echo "=== TEST MANAGEMENT ==="

# List test plans
az test plan list \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: All test plans in the project

# Create a test plan
az test plan create \
  --name "Sprint 1 Test Plan" \
  --description "Test plan for Sprint 1 features" \
  --area-path "$PROJECT_NAME" \
  --iteration-path "$PROJECT_NAME\Sprint 1" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: New test plan

# List test suites in a test plan
az test suite list \
  --plan-id 1 \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: Test suites in the specified plan

# Create a test suite
az test suite create \
  --name "Authentication Tests" \
  --plan-id 1 \
  --suite-type "StaticTestSuite" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME
# Creates: Test suite in the test plan

# =============================================================================
# ANALYTICS AND REPORTING
# =============================================================================

echo "=== ANALYTICS AND REPORTING ==="

# Get project statistics
az devops project show \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --query "{name:name, state:state, lastUpdateTime:lastUpdateTime, revision:revision}"
# Shows: Basic project statistics

# List recent activities (via work items)
az boards query \
  --wiql "SELECT [System.Id], [System.Title], [System.ChangedDate] FROM WorkItems WHERE [System.ChangedDate] > @Today - 7 ORDER BY [System.ChangedDate] DESC" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output table
# Shows: Work items changed in the last 7 days

# Get build statistics
az pipelines runs list \
  --pipeline-ids $(az pipelines list --project "$PROJECT_NAME" --org https://dev.azure.com/$ORG_NAME --query "[0].id" -o tsv) \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --query "[].{id:id, status:status, result:result, finishTime:finishTime}" \
  --output table
# Shows: Recent build runs with status

# =============================================================================
# ADVANCED AZURE DEVOPS FEATURES
# =============================================================================

echo "=== ADVANCED AZURE DEVOPS FEATURES ==="

# Configure project settings
az devops configure --list
# Shows: Current configuration settings

# Set default values for commands
az devops configure --defaults \
  organization=https://dev.azure.com/$ORG_NAME \
  project="$PROJECT_NAME"
# Sets: Default organization and project

# Invoke Azure DevOps REST API directly
az devops invoke \
  --area "core" \
  --resource "projects" \
  --org https://dev.azure.com/$ORG_NAME \
  --api-version "6.0"
# Invokes: REST API to get projects

# Export project data
az boards query \
  --wiql "SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State] FROM WorkItems" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --output json > project-workitems.json
# Exports: All work items to JSON file

# =============================================================================
# BULK OPERATIONS AND AUTOMATION
# =============================================================================

echo "=== BULK OPERATIONS AND AUTOMATION ==="

# Bulk update work items (example: close old bugs)
az boards query \
  --wiql "SELECT [System.Id] FROM WorkItems WHERE [System.WorkItemType] = 'Bug' AND [System.CreatedDate] < @Today - 90" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --query "workItems[].id" \
  --output tsv | \
while read -r workitem_id; do
  az boards work-item update \
    --id "$workitem_id" \
    --state "Closed" \
    --reason "Stale bug - auto-closed after 90 days" \
    --project "$PROJECT_NAME" \
    --org https://dev.azure.com/$ORG_NAME
done
# Closes: Bugs older than 90 days

# Bulk assign work items to team members
TEAM_MEMBERS=("dev1@example.com" "dev2@example.com" "dev3@example.com")
COUNTER=0

az boards query \
  --wiql "SELECT [System.Id] FROM WorkItems WHERE [System.WorkItemType] = 'Task' AND [System.AssignedTo] = ''" \
  --project "$PROJECT_NAME" \
  --org https://dev.azure.com/$ORG_NAME \
  --query "workItems[].id" \
  --output tsv | \
while read -r workitem_id; do
  ASSIGNEE=${TEAM_MEMBERS[$((COUNTER % ${#TEAM_MEMBERS[@]}])]}
  az boards work-item update \
    --id "$workitem_id" \
    --assigned-to "$ASSIGNEE" \
    --project "$PROJECT_NAME" \
    --org https://dev.azure.com/$ORG_NAME
  ((COUNTER++))
done
# Assigns: Unassigned tasks to team members in round-robin fashion

# Create multiple environments for different stages
ENVIRONMENTS=("Development" "Testing" "Staging" "Production")
for env in "${ENVIRONMENTS[@]}"; do
  az pipelines environment create \
    --name "$env" \
    --description "$env environment for application deployment" \
    --project "$PROJECT_NAME" \
    --org https://dev.azure.com/$ORG_NAME 2>/dev/null || echo "Environment $env already exists"
done
# Creates: Standard deployment environments

# =============================================================================
# AZURE INTEGRATION AND HYBRID SCENARIOS
# =============================================================================

echo "=== AZURE INTEGRATION AND HYBRID SCENARIOS ==="

# List Azure subscriptions accessible to the service principal
az account list --output table
# Shows: Azure subscriptions for hybrid deployments

# Create resource group for DevOps resources
az group create \
  --name "rg-devops-$PROJECT_NAME" \
  --location "East US"
# Creates: Resource group for project infrastructure

# Deploy Azure resources using ARM template from repository
# az deployment group create \
#   --resource-group "rg-devops-$PROJECT_NAME" \
#   --template-file "./infrastructure/azuredeploy.json" \
#   --parameters "./infrastructure/azuredeploy.parameters.json"
# Deploys: Infrastructure as Code from repository

# Integrate with Azure Key Vault for secrets
az keyvault create \
  --name "kv-devops-$(date +%s)" \
  --resource-group "rg-devops-$PROJECT_NAME" \
  --location "East US"
# Creates: Key Vault for storing secrets

# Add secret to Key Vault
az keyvault secret set \
  --vault-name "kv-devops-$(date +%s)" \
  --name "DatabaseConnectionString" \
  --value "Server=tcp:server.database.windows.net;Database=mydb;User=admin;"
# Stores: Database connection string securely

# =============================================================================
# CLEANUP AND BEST PRACTICES
# =============================================================================

echo "=== CLEANUP AND BEST PRACTICES ==="

# Clear Azure DevOps CLI cache
az devops logout
# Clears: Stored authentication tokens

# Display current configuration
az devops configure --list
# Shows: Current CLI configuration

# Show Azure CLI version and extensions
az version
# Shows: CLI version and all installed extensions

# Update Azure CLI and extensions
az upgrade
# Updates: Azure CLI to the latest version

# List all extensions and their versions
az extension list --output table
# Shows: All installed extensions with versions

# =============================================================================
# SCRIPT COMPLETION AND SUMMARY
# =============================================================================

echo "=== DEMO SCRIPT COMPLETED ==="
echo "Azure CLI + Azure DevOps Demo Tasks Completed:"
echo " Authentication and setup"
echo " Project and repository management"
echo " Team and access control"
echo " Branch policies and protection"
echo " Pull request workflows"
echo " Work items and project management"
echo " Build and release pipelines"
echo " Environments and deployments"
echo " Variable groups and secrets"
echo " Service connections"
echo " Test management"
echo " Analytics and reporting"
echo " Azure integration"

echo ""
echo "Next Steps:"
echo "1. Compare with github-cli-demo-script.sh for platform differences"
echo "2. Practice these commands in your own Azure DevOps organization"
echo "3. Customize variables at the top of the script for your environment"
echo "4. Use these patterns in your AZ-400 course demonstrations"

echo ""
echo "For AZ-400 Exam Success:"
echo "- Focus on parallel features between Azure DevOps and GitHub"
echo "- Understand hybrid scenarios using both platforms"
echo "- Practice CLI automation for common DevOps tasks"
echo "- Remember the new GitHub Enterprise + Azure DevOps Basic integration"

echo ""
echo "Key CLI Extensions for AZ-400:"
echo "- azure-devops: Core Azure DevOps functionality"
echo "- azure-cli-ml: Machine Learning integration"
echo "- azure-cli-iot: IoT device management"
echo "- Use 'az extension list-available' to see all options"

# =============================================================================
# END OF SCRIPT
# =============================================================================