# Pipeline Examples for AZ-400 Training

This directory contains verified YAML pipeline examples for teaching CI/CD concepts in the AZ-400 course.

## 📁 Pipeline Files

### 1. Single-Stage CI Pipeline (`single-stage-ci.yml`)
**Purpose:** Basic continuous integration for Node.js applications

**Key Features:**
- Node.js setup and dependency installation
- Linting and code quality checks
- Unit testing with coverage
- Artifact creation and publishing
- Clear commenting for learning

**Use Case:** Teaching CI fundamentals in Segment 2

### 2. Multi-Stage CI/CD Pipeline (`multi-stage-cicd.yml`)
**Purpose:** Complete DevOps pipeline with multiple environments

**Key Features:**
- 5 stages: Build → Dev → Staging → Production → Post-Deploy
- Environment approvals and gates
- Blue-green deployment strategy
- Automated rollback on failure
- Performance and integration testing
- Deployment slots and swapping

**Use Case:** Advanced pipeline concepts in Segment 3

### 3. GitHub Actions Workflow (`../.github/workflows/node-azure-deploy.yml`)
**Purpose:** GitHub-native CI/CD to Azure

**Key Features:**
- Matrix strategy for multiple Node versions
- GitHub environments with protection rules
- Azure Web App deployment
- Release tagging
- Security scanning with CodeQL
- Reusable workflow patterns

**Use Case:** Comparing Azure Pipelines vs GitHub Actions

## 🚀 How to Use These Examples

### For Azure Pipelines:
1. Create a new pipeline in Azure DevOps
2. Select "Existing Azure Pipelines YAML file"
3. Choose the appropriate YAML file
4. Update variables (service connections, resource names)
5. Save and run

### For GitHub Actions:
1. Workflow is automatically detected in `.github/workflows/`
2. Configure secrets in repository settings:
   - `AZURE_CREDENTIALS` - Service principal JSON
3. Workflow triggers on push to main/master

## 📝 Required Configuration

### Azure Resources:
```bash
# Create resource group
az group create --name rg-az400-demo --location eastus

# Create App Service Plan
az appservice plan create \
  --name plan-az400-demo \
  --resource-group rg-az400-demo \
  --sku B1 \
  --is-linux

# Create Web Apps
az webapp create \
  --name webapp-az400-demo-dev \
  --resource-group rg-az400-demo \
  --plan plan-az400-demo \
  --runtime "NODE:18-lts"
```

### Service Connection (Azure DevOps):
1. Project Settings → Service connections
2. New service connection → Azure Resource Manager
3. Service principal (automatic)
4. Name: `AZ400-ServiceConnection`

### GitHub Secrets:
```bash
# Create service principal
az ad sp create-for-rbac \
  --name "sp-az400-github" \
  --role contributor \
  --scopes /subscriptions/{subscription-id}/resourceGroups/rg-az400-demo \
  --json-auth
```

## 🎓 Teaching Points

### Single-Stage Pipeline:
- Pipeline triggers and paths
- Agent pools and VM images
- Variables and expressions
- Task vs script steps
- Artifact publishing

### Multi-Stage Pipeline:
- Stage dependencies
- Deployment jobs vs regular jobs
- Environment approvals
- Deployment strategies
- Failure handling

### GitHub Actions:
- Workflow syntax differences
- Actions marketplace
- Environments and secrets
- Reusable workflows
- GitHub-specific features

## 🔧 Customization

Students can modify these pipelines to:
- Add additional testing frameworks
- Implement different deployment strategies
- Add notifications (Teams, Slack)
- Include infrastructure as code
- Add security scanning tools

## 📚 Additional Resources

- [Azure Pipelines YAML schema](https://learn.microsoft.com/azure/devops/pipelines/yaml-schema)
- [GitHub Actions documentation](https://docs.github.com/actions)
- [Azure Web Apps deployment](https://learn.microsoft.com/azure/app-service/deploy-github-actions)
