# AZ-400 Demo Environment Setup Guide

Welcome to the AZ-400 course! This guide will help you set up a complete demo environment for learning Azure DevOps and GitHub Enterprise features. Please follow these steps in order to ensure everything works correctly.

## Prerequisites
- Windows 10/11, macOS, or Linux computer with at least 8GB RAM
- Administrative access to install software
- A Microsoft account (create one at https://account.microsoft.com if needed)
- A GitHub account (create one at https://github.com if needed)
- Stable internet connection

---

## 1. Visual Studio Community Edition Setup

Visual Studio Community is a free, fully-featured IDE for students, open-source contributors, and individuals.

### Installation Steps:
1. **Download Visual Studio Community 2022**
   - Navigate to: https://visualstudio.microsoft.com/vs/community/
   - Click "Download Visual Studio" button
   - Save the installer to your computer

2. **Run the Installer**
   - Launch the Visual Studio Installer
   - Select the following workloads:
     - ✅ **ASP.NET and web development**
     - ✅ **Azure development**
     - ✅ **.NET desktop development**
     - ✅ **Node.js development** (optional but recommended)
   - Under "Individual components" tab, ensure these are selected:
     - Git for Windows
     - GitHub extension for Visual Studio
     - Azure DevOps Office Integration

3. **Configure Visual Studio**
   - Launch Visual Studio after installation
   - Sign in with your Microsoft account
   - Choose your preferred theme and development settings

4. **Enable GitHub Copilot in Visual Studio**
   - Go to **Extensions** → **Manage Extensions**
   - Search for "GitHub Copilot"
   - Click **Download** and restart Visual Studio
   - After restart, go to **Tools** → **Options** → **GitHub** → **Copilot**
   - Sign in with your GitHub account
   - Ensure Copilot is enabled

### Verification:
- Create a new project and verify IntelliSense is working
- Check that Git integration is available in Team Explorer

---

## 2. Azure DevOps Free Tier Setup

Azure DevOps provides free tier access with generous limits perfect for learning.

### Sign Up Process:
1. **Navigate to Azure DevOps**
   - Go to: https://azure.microsoft.com/en-us/services/devops/
   - Click **"Start free"** button

2. **Create Your Organization**
   - Sign in with your Microsoft account
   - Choose a unique organization name (e.g., yourname-az400-learn)
   - Select your preferred region
   - Complete the CAPTCHA verification

3. **Create Your First Project**
   - Project name: "AZ400-Demo"
   - Visibility: Private (you can change this later)
   - Advanced options:
     - Version control: Git
     - Work item process: Agile

### Free Tier Includes:
- 5 free users with full access
- Unlimited private Git repositories
- 1,800 minutes of CI/CD per month
- 2 GB of artifact storage

### Organization Settings:
1. Go to Organization Settings (bottom left)
2. Under **Security** → **Policies**:
   - Enable "Third-party application access via OAuth"
   - Enable "Allow public projects" (for demo purposes)
3. Under **Billing**:
   - Verify you're on the free tier
   - Note the included services

---

## 3. Azure DevOps Demo Generator Setup

The Demo Generator creates sample projects with pre-configured repos, pipelines, and work items.

### Setup Instructions:

1. **Prerequisites**
   - Install .NET 6.0 SDK or later: https://dotnet.microsoft.com/download
   - Install Git: https://git-scm.com/downloads
   - Ensure Visual Studio 2022 is installed (from Step 1)

2. **Clone the Repository**
   ```bash
   git clone https://github.com/microsoft/AzDevOpsDemoGenerator.git
   cd AzDevOpsDemoGenerator
   ```

3. **Build and Run Locally**
   ```bash
   # Restore dependencies
   dotnet restore

   # Build the solution
   dotnet build

   # Run the application
   cd src/AzureDevOpsDemoBuilder
   dotnet run
   ```

4. **Access the Demo Generator**
   - Open browser to: http://localhost:5000
   - Sign in with your Azure DevOps account
   - Grant permissions when prompted

5. **Generate Demo Projects**
   - Select a template (recommended: "PartsUnlimited" or "SmartHotel360")
   - Choose your Azure DevOps organization
   - Provide a unique project name
   - Click "Create Project"
   - Wait for generation to complete (usually 2-3 minutes)

### Alternative: Use Hosted Version
If you prefer not to run locally:
- Navigate to: https://azuredevopsdemogenerator.azurewebsites.net/
- Follow the same steps as above

### Recommended Templates:
- **PartsUnlimited**: E-commerce application with CI/CD pipelines
- **SmartHotel360**: Microservices architecture demo
- **WhiteSource Bolt**: Security scanning integration
- **SonarCloud**: Code quality analysis

---

## 4. Azure DevOps Labs

Access hands-on labs and learning materials at Azure DevOps Labs.

### Getting Started:
1. **Navigate to Azure DevOps Labs**
   - URL: https://azuredevopslabs.com/
   - Bookmark this site for easy access

2. **Explore Available Labs**
   - **Getting Started Labs**:
     - Agile Planning and Portfolio Management
     - Version Controlling with Git
     - Package Management
   - **CI/CD Labs**:
     - Enabling Continuous Integration
     - Integrating Azure Key Vault
     - Deploying to Azure App Service
   - **Advanced Topics**:
     - LaunchDarkly Feature Flags
     - Monitoring with Application Insights
     - Security with WhiteSource Bolt

3. **Lab Prerequisites**
   - Each lab lists specific prerequisites
   - Most require the Demo Generator projects
   - Some need Azure subscription (free trial works)

### Pro Tips:
- Start with "Getting Started" labs
- Complete labs in suggested order
- Use the provided Azure DevOps project from Demo Generator
- Take screenshots for your notes

---

## 5. Visual Studio Code Setup

VS Code is essential for modern DevOps workflows with excellent Git and Azure integration.

### Installation:
1. **Download VS Code**
   - Navigate to: https://code.visualstudio.com/
   - Download for your operating system
   - Run installer with default settings

2. **Initial Configuration**
   - Launch VS Code
   - Sign in with your GitHub account (top-right profile icon)
   - Enable Settings Sync

### Essential Extensions:

#### GitHub Extensions:
1. **GitHub Pull Requests and Issues**
   - Publisher: GitHub
   - ID: GitHub.vscode-pull-request-github
   - Features: PR review, issue management

2. **GitHub Copilot**
   - Publisher: GitHub
   - ID: GitHub.copilot
   - Sign in with GitHub account after installation
   - Verify Copilot icon appears in status bar

3. **GitHub Actions**
   - Publisher: GitHub
   - ID: github.vscode-github-actions
   - Features: Workflow authoring and monitoring

#### Azure/DevOps Extensions:
1. **Azure Account**
   - Publisher: Microsoft
   - ID: ms-vscode.azure-account
   - Required for Azure integration

2. **Azure Repos**
   - Publisher: Microsoft
   - ID: ms-vscode.azure-repos
   - Features: Azure DevOps repository integration

3. **Azure Pipelines**
   - Publisher: Microsoft
   - ID: ms-azure-devops.azure-pipelines
   - Features: YAML pipeline authoring with IntelliSense

4. **Azure Tools**
   - Publisher: Microsoft
   - ID: ms-vscode.vscode-node-azure-pack
   - Includes multiple Azure service extensions

5. **Docker**
   - Publisher: Microsoft
   - ID: ms-azuretools.vscode-docker
   - Essential for container development

#### Additional Recommended Extensions:
1. **YAML**
   - Publisher: Red Hat
   - ID: redhat.vscode-yaml
   - YAML syntax and validation

2. **GitLens**
   - Publisher: GitKraken
   - ID: eamodio.gitlens
   - Advanced Git features

3. **REST Client**
   - Publisher: Huachao Mao
   - ID: humao.rest-client
   - API testing within VS Code

4. **Terraform**
   - Publisher: HashiCorp
   - ID: hashicorp.terraform
   - Infrastructure as Code support

### VS Code Settings:
1. Open Settings (Ctrl+,)
2. Search and configure:
   - `git.enableSmartCommit`: true
   - `git.confirmSync`: false
   - `github.copilot.enable`: true
   - `azure.tenant`: (your Azure AD tenant if applicable)

### Verify GitHub Copilot:
1. Create a new file with .js, .py, or .cs extension
2. Type a comment like `// function to calculate fibonacci`
3. Press Enter and wait for Copilot suggestion
4. Press Tab to accept suggestion

---

## 6. Additional Setup Steps

### Azure Subscription (Optional but Recommended):
1. **Azure Free Account**
   - Navigate to: https://azure.microsoft.com/free/
   - Sign up for $200 credit and 12 months of free services
   - No automatic charges after trial

2. **Link Azure to Azure DevOps**
   - In Azure DevOps, go to Project Settings
   - Select "Service connections"
   - New service connection → Azure Resource Manager
   - Choose "Service principal (automatic)"

### Git Configuration:
```bash
# Set global Git configuration
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Configure credential manager
git config --global credential.helper manager-core

# Set default branch name
git config --global init.defaultBranch main
```

### GitHub Configuration:
1. **Personal Access Token** (for Azure DevOps integration)
   - Go to GitHub → Settings → Developer settings
   - Personal access tokens → Tokens (classic)
   - Generate new token with repo, workflow scopes
   - Save token securely

2. **SSH Keys** (optional but recommended)
   ```bash
   # Generate SSH key
   ssh-keygen -t ed25519 -C "your.email@example.com"
   
   # Add to ssh-agent
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   
   # Copy public key
   cat ~/.ssh/id_ed25519.pub
   ```
   - Add public key to GitHub → Settings → SSH and GPG keys

---

## Troubleshooting

### Common Issues:

1. **Visual Studio Installation Fails**
   - Ensure you have enough disk space (minimum 10GB)
   - Run installer as Administrator
   - Temporarily disable antivirus

2. **Azure DevOps Sign-in Issues**
   - Clear browser cache
   - Try incognito/private mode
   - Ensure Microsoft account is verified

3. **Demo Generator Errors**
   - Verify .NET SDK is installed: `dotnet --version`
   - Check Personal Access Token permissions
   - Ensure project names are unique

4. **GitHub Copilot Not Working**
   - Verify GitHub account has Copilot access
   - Check firewall/proxy settings
   - Restart VS Code/Visual Studio

5. **Extension Installation Issues**
   - Update VS Code to latest version
   - Check internet connectivity
   - Try installing from VSIX file directly

---

## Verification Checklist

Before starting the course, verify:

- [ ] Visual Studio Community 2022 is installed
- [ ] GitHub Copilot works in Visual Studio
- [ ] Azure DevOps organization is created
- [ ] At least one demo project is generated
- [ ] VS Code is installed with all extensions
- [ ] GitHub Copilot works in VS Code
- [ ] Git commits work from command line
- [ ] You can access https://azuredevopslabs.com/

---

## Support Resources

- **Azure DevOps Documentation**: https://docs.microsoft.com/azure/devops/
- **GitHub Documentation**: https://docs.github.com/
- **Visual Studio Help**: https://docs.microsoft.com/visualstudio/
- **VS Code Documentation**: https://code.visualstudio.com/docs
- **Course Support Forum**: [Your course forum URL]
- **Instructor Contact**: [Your contact information]

---

## Next Steps

Once your environment is set up:
1. Explore the generated demo projects
2. Complete the first lab from Azure DevOps Labs
3. Practice creating a simple pipeline
4. Familiarize yourself with both Azure DevOps and GitHub interfaces

Good luck with your AZ-400 journey!