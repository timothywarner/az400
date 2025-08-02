# AZ-400 Course Plan - August 2025
## 5-Hour Live Learning Course for O'Reilly

### Course Overview
This course covers the AZ-400: Designing and Implementing Microsoft DevOps Solutions exam objectives with a hybrid approach using both Azure DevOps and GitHub Enterprise Cloud. Each hour-long segment balances theory, hands-on demonstrations, and Q&A.

---

## Hour 1: DevOps Foundation & Source Control Strategy
**Coverage: Domain 1 (10-15%) + Domain 2 (10-15%)**

### Topics Covered
1. **DevOps Processes and Communications (30 min)**
   - Azure DevOps vs GitHub Enterprise Cloud architecture comparison
   - Implementing Azure Boards AND GitHub Projects for work tracking
   - Creating dashboards in both platforms
   - Configuring webhooks and Teams integration (both platforms)
   - Wiki and documentation strategies across repositories

2. **Source Control Strategy (30 min)**
   - Git branching strategies for enterprise environments
   - Implementing GitHub Flow AND Azure DevOps Git Flow
   - Branch protection rules in GitHub and Azure Repos
   - Managing large files with Git LFS
   - Repository permissions and RBAC in both platforms

### Hands-On Demo
- Create parallel workflows in Azure DevOps and GitHub
- Configure branch policies and protection rules
- Set up cross-platform integration

---

## Hour 2: Build Pipelines & Package Management
**Coverage: Domain 3 Part 1 (25% of the 50-55%)**

### Topics Covered
1. **Package Management Strategy (30 min)**
   - Azure Artifacts AND GitHub Packages configuration
   - Creating feeds and upstream sources
   - Semantic versioning (SemVer) implementation
   - Container registry management in both ecosystems

2. **Build Pipeline Design (30 min)**
   - GitHub Actions vs Azure Pipelines architecture
   - YAML pipeline development for both platforms
   - Shared runners/agents configuration
   - Matrix builds and parallel jobs
   - Reusable workflows (GitHub) and templates (Azure DevOps)

### Hands-On Demo
- Create multi-stage YAML pipelines in both platforms
- Configure package feeds with upstream sources
- Implement build caching and optimization

---

## Hour 3: Testing, Deployment & Release Strategies
**Coverage: Domain 3 Part 2 (25% of the 50-55%)**

### Topics Covered
1. **Testing Strategy Implementation (30 min)**
   - Quality gates in Azure DevOps and GitHub
   - Test integration (unit, integration, load tests)
   - Code coverage with SonarCloud/SonarQube
   - Security scanning with GitHub Advanced Security AND Azure DevOps extensions

2. **Deployment Strategies (30 min)**
   - Blue-green and canary deployments
   - Feature flags with Azure App Configuration
   - GitHub Environments AND Azure Pipeline Environments
   - Approval workflows and checks
   - Container deployments to AKS and ACR

### Hands-On Demo
- Implement deployment gates and approvals
- Configure multi-environment deployments
- Set up feature flags and progressive rollouts

---

## Hour 4: Infrastructure as Code & Security
**Coverage: Domain 3 Part 3 + Domain 4 (10-15%)**

### Topics Covered
1. **Infrastructure as Code (30 min)**
   - Terraform with GitHub Actions AND Azure Pipelines
   - ARM/Bicep templates deployment strategies
   - Azure Deployment Environments
   - GitOps principles with both platforms
   - State management and backend configuration

2. **Security and Compliance (30 min)**
   - Service principals and managed identities
   - GitHub OIDC vs Azure DevOps service connections
   - Azure Key Vault integration for secrets
   - GitHub Secrets AND Azure Pipeline Variables
   - Dependency scanning and vulnerability management

### Hands-On Demo
- Deploy infrastructure using IaC in both platforms
- Configure OIDC authentication for cloud deployments
- Implement secret scanning and rotation

---

## Hour 5: Monitoring, Optimization & Enterprise Scenarios
**Coverage: Domain 5 (5-10%) + Advanced Topics**

### Topics Covered
1. **Instrumentation and Monitoring (30 min)**
   - Application Insights integration
   - GitHub Actions monitoring vs Azure Pipeline analytics
   - Custom metrics and KQL queries
   - Distributed tracing implementation
   - Cost analysis and optimization

2. **Enterprise Migration and Hybrid Scenarios (30 min)**
   - Migrating from Classic to YAML pipelines
   - GitHub to Azure DevOps synchronization
   - Cross-platform artifact sharing
   - Enterprise governance at scale
   - Pipeline performance optimization
   - Retention policies and compliance

### Hands-On Demo
- Configure end-to-end monitoring
- Implement cross-platform CI/CD
- Optimize pipeline performance and costs

---

## Course Resources

### Prerequisites
- Azure subscription with DevOps organization
- GitHub Enterprise Cloud access
- Basic Git and YAML knowledge
- Familiarity with cloud concepts

### Lab Environment
- Pre-configured Azure DevOps organization
- GitHub Enterprise Cloud organization
- Sample applications for all demos
- IaC templates repository

### Post-Course Materials
- Complete YAML pipeline examples
- IaC template library
- Security baseline configurations
- Integration patterns documentation

### Certification Preparation
- Practice exam questions after each hour
- Real-world scenario discussions
- Exam tips and common pitfalls
- Additional study resources

---

## Time Management Guidelines
Each hour follows this structure:
- 50 minutes: Content delivery and demos
- 10 minutes: Q&A and practice questions

## Key Differentiators for Aug 2025
1. **Fully Hybrid Approach**: Every topic covers BOTH Azure DevOps and GitHub Enterprise Cloud
2. **No Either/Or Scenarios**: Students learn to implement solutions in both platforms
3. **Cross-Platform Integration**: Focus on making both systems work together
4. **Enterprise Scale**: All examples assume large organization requirements
5. **Latest Features**: Includes GitHub Copilot integration, AI-assisted DevOps, and advanced security features