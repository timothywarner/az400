# AZ-400 Course Plan

---

## Segment 1: DevOps Foundations, Source Control, and Artifacts
- **DevOps Overview**
  - Core principles: CI/CD, collaboration, automation, monitoring.
  - Azure DevOps vs. GitHub: when to use each.
- **Setting Up Projects**
  - Create a project in Azure DevOps and link it to GitHub.
  - Sync Azure Boards with GitHub Issues.
- **Source Control Basics**
  - Branching strategies: GitFlow, trunk-based, feature flags.
  - Create branches and enforce policies in Azure Repos and GitHub.
- **Pull Requests (PRs)**
  - Create, review, and automate PR workflows.
  - Link PRs to work items for traceability.
- **Artifacts**
  - Publish and manage artifacts in Azure Pipelines and GitHub Packages.
  - Use artifact feeds for package storage (NuGet, npm).
- **Interactive Demos**
  - Use VS Code and GitHub Desktop for workflows.
  - Publish a package to Azure Artifacts and GitHub Packages.

---

## Segment 2: Continuous Integration (CI)
- **CI Basics**
  - Automate build pipelines for code validation and integration.
- **Azure Pipelines**
  - Create a YAML-based CI pipeline for a Node.js/.NET app.
  - Add build steps, triggers, and notifications.
- **GitHub Actions**
  - Build a CI workflow using reusable Actions.
  - Compare YAML workflows in GitHub and Azure Pipelines.
- **Testing in CI**
  - Add unit and static analysis tests to pipelines (e.g., NUnit, Jest, SonarCloud).
- **Pipeline Optimization**
  - Enable caching to reduce build times.
  - Analyze build outputs and logs for debugging.
- **Interactive Demos**
  - Run a pipeline, view test results, and resolve issues live.

---

## Segment 3: Continuous Delivery (CD)
- **CD Basics**
  - Automate deployments with release pipelines and GitHub Actions.
- **Release Pipelines**
  - Create release pipelines in Azure DevOps.
  - Add dev, staging, and production environments.
- **Deployment Strategies**
  - Demo blue-green and canary deployments.
  - Configure rollback steps for fail-safe deployments.
- **Infrastructure as Code (IaC)**
  - Use ARM templates, Bicep, or Terraform for automated deployments.
- **GitHub Environments**
  - Manage deployment stages and secrets with GitHub Environments.
- **Interactive Demos**
  - Deploy an app to Azure App Service using pipelines and GitHub Actions.

---

## Segment 4: Security, Compliance, and Monitoring
- **DevSecOps**
  - Shift-left security: early integration into CI/CD pipelines.
- **Code Analysis**
  - Use SonarCloud and GitHub Advanced Security for scans.
- **Secure Secrets**
  - Manage sensitive data with Azure Key Vault and GitHub Secrets.
- **Compliance**
  - Enforce Azure Policy and GitHub branch protection rules.
- **Monitoring Deployments**
  - Set up Azure Monitor and Application Insights.
  - Add alerts and dashboards for live feedback.
- **Feedback Loops**
  - Track post-deployment feedback in Azure Boards and GitHub Discussions.
- **Interactive Demos**
  - Show a monitored deployment with live telemetry and issue tracking.

---

## Segment 5: Exam Prep and Strategy
- **Objective Domain Overview**
  - Recap exam topics: CI/CD, testing, artifacts, monitoring, and IaC.
- **Practice Questions**
  - Solve AZ-400-style case studies, drag-and-drop, and multiple-choice questions.
- **Hands-On Labs**
  - Explore practice labs in Microsoft Learn (CI/CD and IaC scenarios).
- **Exam Tips**
  - Manage time effectively; focus on key tasks during labs.
- **Resources**
  - Provide links to Microsoft Learn, sandbox labs, and study guides.
- **Closing Q&A**
  - Address final questions and ensure learners are exam-ready.

---

**Key Features**:
- **Flow**: Logical and compact progression from foundations to advanced topics.
- **Hands-On**: Demos in every segment using Azure DevOps and GitHub.
- **Exam-Focused**: Ends with a dedicated segment for AZ-400 exam readiness.
