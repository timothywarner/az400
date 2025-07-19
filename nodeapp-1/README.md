# Node Express Azure - AZ-400 Demo App

Sample Node.js Express application for demonstrating CI/CD pipelines in AZ-400 training.

## Features

- Express.js web application
- Handlebars templating
- Mocha/Chai testing with mochawesome reports
- ESLint for code quality
- Docker support
- Azure DevOps and GitHub Actions ready

## Getting Started

### Prerequisites

- Node.js 18.x or higher
- npm 8.x or higher

### Installation

```bash
npm install
```

### Running Locally

```bash
npm start
```

The app will be available at http://localhost:3000

### Running Tests

```bash
npm test
```

### Linting

```bash
npm run lint
```

### Docker

Build the image:
```bash
docker build -t nodeapp-1 .
```

Run the container:
```bash
docker run -p 3000:3000 nodeapp-1
```

## CI/CD Pipelines

This app includes example pipelines for:
- Azure Pipelines (see `/pipelines` folder in repo root)
- GitHub Actions (see `.github/workflows` in repo root)

## Azure Artifacts

To publish to Azure Artifacts:

1. Create `.npmrc` from `.npmrc.template`
2. Set up authentication
3. Run `npm run publish:dev` or `npm run publish:prod`

## Environment Variables

- `PORT` - Server port (default: 3000)
- `NODE_ENV` - Environment (development/production)
- `AZURE_ARTIFACTS_FEED` - Azure Artifacts feed URL
