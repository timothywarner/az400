# AZ-400 Course Plan - O'Reilly Training
## 5 x 50-minute segments aligned with July 2024 Objective Domain

---

## Segment 1: DevOps Foundation & Team Setup
**Theme:** Starting the Journey - People, Process, Tools

### Core Topics
- **DevOps Culture & Principles**
  - CI/CD mindset and continuous value delivery
  - Breaking down silos between Dev, Ops, and Security
  - Azure DevOps vs GitHub: choosing the right platform

- **Project Setup & Organization**
  - Creating Azure DevOps organizations and projects
  - GitHub repository structure and GitHub Flow implementation
  - Configuring two-way sync between Azure Boards and GitHub Issues
  
- **Work Tracking & Traceability**
  - Implementing source, bug, and quality traceability
  - Configuring GitHub Projects and Azure Boards integration
  - Creating feedback cycles with notifications and issues

- **Access Management**
  - Azure DevOps security groups and permissions
  - GitHub roles and outside collaborator access
  - Stakeholder access patterns and best practices

- **Documentation & Communication**
  - Wiki configuration with Markdown and Mermaid diagrams
  - Process documentation and team collaboration
  - Webhook integration for automated notifications

### Interactive Demo
- Create a new project with proper team structure
- Set up Azure Boards + GitHub integration
- Configure basic wiki with team processes

---

## Segment 2: Source Control & CI Fundamentals
**Theme:** Code Management & Quality Gates

### Core Topics
- **Git Strategies & Workflows**
  - Trunk-based development vs feature branching
  - Implementing GitHub Flow effectively
  - Branch naming conventions and PR templates

- **Branch Protection & Policies**
  - Enforcing code review requirements
  - Status checks and automated validation
  - PR automation with GitHub Apps and bots

- **Building Your First CI Pipeline**
  - YAML pipeline fundamentals
  - Azure Pipelines vs GitHub Actions syntax
  - Triggers, variables, and conditions

- **Code Quality Integration**
  - Static code analysis with SonarCloud
  - Linting and code formatting checks
  - Unit test integration and coverage gates

- **Artifact Management**
  - Publishing to Azure Artifacts and GitHub Packages
  - Managing NuGet, npm, and container feeds
  - Dependency scanning with Dependabot

### Interactive Demo
- Create a multi-stage CI pipeline
- Integrate code quality tools
- Publish artifacts to package feeds

---

## Segment 3: Advanced Pipelines & Deployment
**Theme:** From Code to Cloud

### Core Topics
- **Multi-Stage YAML Pipelines**
  - Environment approvals and gates
  - Pipeline templates and reusability
  - Matrix builds and parallel jobs

- **Deployment Strategies**
  - Blue-green deployments with slot swaps
  - Canary releases and progressive rollouts
  - Feature flags with Azure App Configuration
  - A/B testing implementation

- **Infrastructure as Code (IaC)**
  - Bicep vs Terraform decision matrix
  - Azure Resource Manager integration
  - Azure Deployment Environments setup
  - Desired State Configuration patterns

- **Container Deployments**
  - Docker build optimization
  - AKS deployment patterns
  - Container registry management
  - Helm chart integration

- **Database Deployment Patterns**
  - Schema migration strategies
  - Data tier application packages (DACPAC)
  - Entity Framework migrations in pipelines

### Interactive Demo
- Deploy app using blue-green strategy
- Implement IaC with Bicep
- Configure feature flags

---

## Segment 4: Security, Compliance & Governance
**Theme:** Secure DevOps at Scale

### Core Topics
- **Identity & Access Management**
  - Service Principals vs Managed Identities
  - GitHub Apps and GITHUB_TOKEN usage
  - Azure DevOps service connections
  - Personal access token management

- **Secrets Management**
  - Azure Key Vault integration patterns
  - GitHub Secrets and Azure Pipeline variables
  - Secure file handling during deployment
  - Preventing secret leakage in logs

- **Security Scanning & Compliance**
  - Microsoft Defender for Cloud DevOps Security
  - GitHub Advanced Security configuration
  - CodeQL analysis and custom queries
  - Container image scanning automation

- **Dependency Management**
  - Dependabot alerts and auto-updates
  - License compliance scanning
  - Supply chain security with SBOM
  - Vulnerability remediation workflows

- **Policy Enforcement**
  - Azure Policy integration
  - Branch protection rules
  - Compliance gates in pipelines
  - Audit logging and reporting

### Interactive Demo
- Configure end-to-end security scanning
- Implement Key Vault secret rotation
- Set up Dependabot with auto-merge

---

## Segment 5: Monitoring, Feedback & Exam Prep
**Theme:** Production Excellence & Certification

### Core Topics
- **Observability Implementation**
  - Application Insights configuration
  - Distributed tracing setup
  - Custom metrics and telemetry
  - Performance baselines

- **Azure Monitor Integration**
  - VM, Container, and Network Insights
  - Log Analytics workspace design
  - Alert rules and action groups
  - Cost optimization monitoring

- **KQL Fundamentals**
  - Basic query structure
  - Performance troubleshooting queries
  - Creating custom dashboards
  - Workbook design

- **DevOps Metrics & KPIs**
  - Lead time and cycle time tracking
  - MTTR and deployment frequency
  - Pipeline health monitoring
  - Flaky test detection

- **Continuous Improvement**
  - Feedback loop implementation
  - Post-incident reviews
  - Chaos engineering basics
  - Technical debt tracking

### Exam Preparation
- **Objective Domain Deep Dive**
  - Weight distribution and focus areas
  - Common question patterns
  - Lab scenario walkthroughs

- **Practice Scenarios**
  - Multi-choice strategy questions
  - Drag-and-drop exercises
  - Case study analysis

- **Resources & Next Steps**
  - Microsoft Learn modules
  - Hands-on labs
  - Community resources
  - Study group recommendations

### Interactive Demo
- Build monitoring dashboard
- Analyze pipeline metrics
- Practice exam scenario

---

## Course Delivery Notes

### Teaching Approach
- Start simple, build complexity progressively
- Real-world scenarios from enterprise implementations
- Balance Azure DevOps and GitHub throughout
- Focus on "why" before "how"

### Key Differentiators
- Modern toolchain focus (VS Code, GitHub Copilot, Cursor AI)
- Enterprise patterns that scale
- Security-first mindset
- Cost-conscious implementations

### Student Outcomes
- Ready for AZ-400 certification
- Practical skills for immediate application
- Understanding of both platforms (Azure DevOps + GitHub)
- Foundation for DevOps leadership roles
