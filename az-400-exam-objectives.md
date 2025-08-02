# AZ-400: Designing and Implementing Microsoft DevOps Solutions - Exam Objectives

## Exam Overview
- **Certification**: Microsoft Certified: DevOps Engineer Expert
- **Exam Code**: AZ-400
- **Passing Score**: 700 or greater
- **Target Audience**: DevOps engineers who combine people, process, and technologies to continuously deliver valuable products and services

## Skills Measured

### 1. Design and implement processes and communications (10-15%)

#### Design and implement traceability and flow of work
- Design and implement an Azure DevOps/GitHub Flow structure
- Design and implement a feedback cycle for developers and operations teams
- Design and implement integration for tracking work
- Design and implement source, bug, and quality traceability

#### Design and implement appropriate metrics and queries for DevOps planning, development, testing, security, delivery, and operations
- Design and implement metrics dashboards and displays, including those that have to do with cycle times
- Design and implement metrics for project planning purposes
- Design and implement metrics for development purposes
- Design and implement metrics for testing purposes
- Design and implement metrics for security purposes
- Design and implement metrics for delivery purposes
- Design and implement metrics for operations purposes

#### Design and implement a structure for project collaboration and communication
- Configure project wikis
- Design and implement project documentation within source repositories
- Create and manage release documentation, including release notes and API documentation
- Design and implement automate documentation from Git history
- Design and implement notification strategies, including issues and pull requests
- Design and configure webhooks
- Integrate GitHub/Azure DevOps with Microsoft Teams

### 2. Design and implement a source control strategy (10-15%)

#### Design and implement a branching strategy for the source repository
- Design a branch strategy, including pull requests, branching, merging, and branch policies
- Implement a branch strategy, including pull requests, branching, merging, and branch policies
- Design and implement forking repositories
- Configure branch merging restrictions (required reviewers, required quality gates)

#### Design and implement repositories
- Design and implement a strategy for managing large files, including Git LFS and git-fat
- Design a scaling strategy for Git repositories, including cross-repository sharing of objects
- Configure permissions in source control repository
- Organize source control repositories
- Design and implement a strategy for using tags to organize source control repositories
- Recover a specific commit, file, or branch from source control history
- Remove specific data from source control history

### 3. Design and implement build and release pipelines (50-55%)

#### Design and implement a package management strategy
- Recommend package management tools, including GitHub Packages registry and Azure Artifacts
- Design a package feeds and views strategy for local and upstream packages
- Design a dependency versioning strategy for code assets (semantic versioning [SemVer] and date-based)
- Design a versioning strategy for pipeline artifacts

#### Design and implement a testing strategy for pipelines
- Design and implement quality and release gates, including security and governance
- Design a comprehensive testing strategy, including local tests, unit tests, integration tests, and load tests
- Implement tests in a pipeline, including configuring test tasks, configuring test agents, and integrating test results
- Implement code coverage analysis

#### Design and implement pipelines
- Select a deployment automation solution, including GitHub Actions and Azure Pipelines
- Design and implement a runner and agent infrastructure, including cost, tool selection, licenses, connectivity, and maintainability
- Design and implement GitHub/Azure Pipelines repository integration (Azure Repos, GitHub, GitLab, BitBucket)
- Design and implement pipeline trigger rules, including GitHub Workflows and Azure Pipelines
- Develop and implement pipeline tasks and stages, including YAML-based and Classic Editor pipelines
- Design and implement a job execution strategy, including parallelism and multi-stage pipelines
- Develop complex pipeline scenarios, such as hybrid pipelines, VM templates, and Docker multi-stage builds
- Create reusable pipeline elements, including YAML templates, task groups, variables, and variable groups
- Design and implement checks and approvals by using YAML environments

#### Design and implement deployments
- Design a deployment strategy, including blue-green deployments, canary deployments, and feature flags
- Design a pipeline to ensure reliable dependency deployments
- Design a strategy to minimize deployment downtime
- Design a hotfix strategy for responding to high-priority code fixes
- Implement deployment resiliency (retry patterns, fault tolerance)
- Implement feature flags by using Azure App Configuration Feature Manager
- Implement deployment to containers, including deployment to container registries, container orchestration platforms, and container compute services
- Implement deployment to binary and script repositories
- Implement database deployment tasks

#### Design and implement infrastructure as code (IaC)
- Recommend a configuration management technology for application infrastructure
- Implement a configuration management strategy for application infrastructure
- Define an IaC strategy, including source control and application of changes
- Design and implement desired state configuration for environments
- Design and implement Azure Deployment Environments

#### Maintain pipelines
- Monitor pipeline health, including failure rate, duration, and flaky tests
- Optimize pipeline performance and cost
- Design and implement a retention strategy for pipeline artifacts and dependencies
- Plan and implement a pipeline migration strategy from classic to YAML pipelines

### 4. Develop a security and compliance plan (10-15%)

#### Design and implement authentication and authorization methods
- Design and implement service principals and managed identities for projects, pipelines, and target environments
- Design and implement an Azure DevOps/GitHub authentication and authorization strategy
- Design and implement permissions and security groups
- Design and implement conditional access to projects and repositories
- Implement Azure role-based access control (RBAC) for projects, pipelines, and target environments

#### Design and implement a strategy for managing sensitive information in automation
- Design and implement a strategy for managing secrets, keys, and certificates by using Azure Key Vault
- Design and implement pipeline secrets
- Design a strategy for preventing accidental exposure of sensitive information in repositories and pipelines
- Design a secure strategy for deployment of applications and services to target environments
- Design and implement a strategy for securing sensitive information in deployment files

#### Design and implement security and compliance scanning
- Design a strategy for security and compliance scanning
- Configure security tools (SonarQube, WhiteSource Bolt, OWASP)
- Configure code quality and security policies
- Automate security and compliance scanning

### 5. Implement an instrumentation strategy (5-10%)

#### Configure monitoring for a DevOps environment
- Configure and integrate Azure Monitor with DevOps tools
- Configure collection of telemetry by using Application Insights, Azure Monitor, and logging tools
- Configure monitoring and status dashboards
- Configure alerts for Azure Pipelines and GitHub Actions

#### Analyze metrics
- Analyze metrics from instrumentation
- Analyze infrastructure performance indicators, including CPU, memory, disk, and network
- Analyze distributed tracing by using Application Insights
- Inspect application performance indicators
- Query logs using KQL (Kusto Query Language)

## Additional Notes
- This exam focuses on both Azure DevOps and GitHub Enterprise Cloud implementations
- Candidates should understand hybrid scenarios and be able to implement solutions using either platform
- Integration between Azure DevOps and GitHub is a key competency
- Infrastructure as Code principles apply across both platforms
- Security and compliance considerations span both ecosystems