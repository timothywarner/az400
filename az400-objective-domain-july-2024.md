# Exam AZ-400: Designing and Implementing Microsoft DevOps Solutions

*Skills measured as of July 26, 2024*

## Skills at a Glance
- Design and implement processes and communications (10–15%)
- Design and implement a source control strategy (10–15%)
- Design and implement build and release pipelines (50–55%)
- Develop a security and compliance plan (10–15%)
- Implement an instrumentation strategy (5–10%)

## Table of Contents
1. [Design and Implement Processes and Communications](#1-design-and-implement-processes-and-communications-1015)
   - [Design and Implement Traceability and Flow of Work](#design-and-implement-traceability-and-flow-of-work)
   - [Design and Implement Appropriate Metrics and Queries for DevOps](#design-and-implement-appropriate-metrics-and-queries-for-devops)
   - [Configure Collaboration and Communication](#configure-collaboration-and-communication)

2. [Design and Implement a Source Control Strategy](#2-design-and-implement-a-source-control-strategy-1015)
   - [Design and Implement Branching Strategies](#design-and-implement-branching-strategies)
   - [Configure and Manage Repositories](#configure-and-manage-repositories)

3. [Design and Implement Build and Release Pipelines](#3-design-and-implement-build-and-release-pipelines-5055)
   - [Design and Implement Package Management Strategy](#design-and-implement-package-management-strategy)
   - [Design and Implement Testing Strategy](#design-and-implement-testing-strategy)
   - [Design and Implement Pipelines](#design-and-implement-pipelines)
   - [Design and Implement Deployments](#design-and-implement-deployments)
   - [Design and Implement Infrastructure as Code](#design-and-implement-infrastructure-as-code-iac)
   - [Maintain Pipelines](#maintain-pipelines)

4. [Develop a Security and Compliance Plan](#4-develop-a-security-and-compliance-plan-1015)
   - [Design and Implement Authentication and Authorization](#design-and-implement-authentication-and-authorization)
   - [Manage Sensitive Information](#manage-sensitive-information)
   - [Security and Compliance Scanning](#security-and-compliance-scanning)

5. [Implement an Instrumentation Strategy](#5-implement-an-instrumentation-strategy-510)
   - [Configure Monitoring](#configure-monitoring)
   - [Analyze Metrics and Telemetry](#analyze-metrics-and-telemetry)

## 1. Design and Implement Processes and Communications (10–15%)

### Design and Implement Traceability and Flow of Work
- Design and implement a structure for the flow of work, including GitHub Flow
- Design and implement a strategy for feedback cycles, including notifications and GitHub issues
- Design and implement integration for tracking work, including GitHub projects, Azure Boards, and repositories
- Design and implement source, bug, and quality traceability

### Design and Implement Appropriate Metrics and Queries for DevOps
- Design and implement a dashboard, including flow of work metrics:
  - Cycle times
  - Time to recovery
  - Lead time
- Design and implement appropriate metrics and queries for:
  - Project planning
  - Development
  - Testing
  - Security
  - Delivery
  - Operations

### Configure Collaboration and Communication
- Document a project by configuring wikis and process diagrams:
  - Markdown syntax
  - Mermaid syntax
- Configure release documentation:
  - Release notes
  - API documentation
- Automate creation of documentation from Git history
- Configure integration:
  - Using webhooks
  - Between Azure Boards and GitHub repositories
  - Between GitHub/Azure DevOps and Microsoft Teams

## 2. Design and Implement a Source Control Strategy (10–15%)

### Design and Implement Branching Strategies
- Design a branch strategy:
  - Trunk-based
  - Feature branch
  - Release branch
- Design and implement pull request workflow using:
  - Branch policies
  - Branch protections
- Implement branch merging restrictions using:
  - Branch policies
  - Branch protections

### Configure and Manage Repositories
- Design and implement strategy for managing large files:
  - Git Large File Storage (LFS)
  - git-fat
- Design repository optimization strategy:
  - Scaling with Scalar
  - Cross-repository sharing
- Configure repository management:
  - Permissions
  - Tags for organization
  - Data recovery using Git commands
  - Data removal from source control

## 3. Design and Implement Build and Release Pipelines (50–55%)

### Design and Implement Package Management Strategy
- Recommend package management tools:
  - GitHub Packages registry
  - Azure Artifacts
- Design and implement:
  - Package feeds and views for local/upstream packages
  - Dependency versioning strategy (SemVer, CalVer)
  - Versioning strategy for pipeline artifacts

### Design and Implement Testing Strategy
- Design and implement:
  - Quality and release gates
  - Security and governance
- Design comprehensive testing strategy:
  - Local tests
  - Unit tests
  - Integration tests
  - Load tests
- Implement pipeline testing:
  - Configure test tasks
  - Configure test agents
  - Test results integration
  - Code coverage analysis

### Design and Implement Pipelines
- Select deployment automation solution:
  - GitHub Actions
  - Azure Pipelines
- Design and implement runner/agent infrastructure:
  - Cost considerations
  - Tool selection
  - Licensing
  - Connectivity
  - Maintainability
- Pipeline development and integration:
  - GitHub repositories with Azure Pipelines
  - Trigger rules
  - YAML pipelines
  - Job execution order (parallelism, multi-stage)
- Complex pipeline scenarios:
  - Hybrid pipelines
  - VM templates
  - Self-hosted runners/agents
- Pipeline elements:
  - YAML templates
  - Task groups
  - Variables and variable groups
  - Checks and approvals using YAML-based environments

### Design and Implement Deployments
- Design deployment strategies:
  - Blue-green
  - Canary
  - Ring
  - Progressive exposure
  - Feature flags
  - A/B testing
- Implementation considerations:
  - Dependency deployment ordering
  - Downtime minimization (VIP swap, load balancing)
  - Rolling deployments
  - Deployment slots
  - Hotfix path planning
  - Resiliency strategy
- Feature implementation:
  - Feature flags with Azure App Configuration
  - Container/binary/script deployment
  - Database task deployment

### Design and Implement Infrastructure as Code (IaC)
- Configuration management:
  - Technology recommendations
  - Strategy implementation
- IaC strategy:
  - Source control
  - Testing automation
  - Deployment automation
- Environment configuration:
  - Azure Automation State Configuration
  - Azure Resource Manager
  - Bicep
  - Azure Automanage Machine Configuration
  - Azure Deployment Environments

### Maintain Pipelines
- Monitoring and optimization:
  - Pipeline health (failure rate, duration, flaky tests)
  - Cost optimization
  - Time optimization
  - Performance optimization
  - Reliability optimization
  - Concurrency optimization
- Management:
  - Retention strategy for artifacts/dependencies
  - Migration from classic to YAML in Azure Pipelines

## 4. Develop a Security and Compliance Plan (10–15%)

### Design and Implement Authentication and Authorization
- Identity management:
  - Service Principals vs Managed Identity
  - GitHub authentication (Apps, GITHUB_TOKEN, PATs)
  - Azure DevOps connections and tokens
- Permission management:
  - GitHub roles and permissions
  - Azure DevOps security groups
  - Access levels (stakeholder, collaborator)
  - Project/team configuration

### Manage Sensitive Information
- Secrets management:
  - Azure Key Vault integration
  - GitHub Actions secrets
  - Azure Pipelines secrets
  - Sensitive file deployment
  - Pipeline security for sensitive data

### Security and Compliance Scanning
- Scanning strategy:
  - Dependency scanning
  - Code scanning
  - Secret scanning
  - License scanning
- Security tooling:
  - Microsoft Defender for Cloud DevOps
  - GitHub Advanced Security
  - Container scanning
  - CodeQL analysis
  - Dependabot alerts

## 5. Implement an Instrumentation Strategy (5–10%)

### Configure Monitoring
- DevOps monitoring:
  - Azure Monitor
  - Log Analytics integration
- Telemetry collection:
  - Application Insights
  - VM Insights
  - Container Insights
  - Storage Insights
  - Network Insights
- GitHub monitoring:
  - Insights configuration
  - Chart creation
  - Alerts for Actions and Pipelines

### Analyze Metrics and Telemetry
- Performance monitoring:
  - CPU, memory, disk, network indicators
  - Usage metrics
  - Application performance
  - Distributed tracing with Application Insights
- Log analysis:
  - Basic KQL queries