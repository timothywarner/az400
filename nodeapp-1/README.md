# Node & Express Demo App for GitHub Actions, Azure DevOps, and Beyond

## Last edited by Tim Warner

> Build Your First CI/CD Pipeline using Azure DevOps with this Demo App.

This is a Node and Express web application used to demonstrate CI/CD with Azure DevOps. You can clone this repo and use it within Azure DevOps to build, test, and release to an Azure App Service web app.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/timothywarner/node-express-azure)

## Running and Testing Locally:

You can use these commands to install, test, and run the app locally. (Not Required)

### Install

```
npm install
```

### Test

```
npm test
```

![alt text](https://user-images.githubusercontent.com/5126491/51065379-c1743280-15c1-11e9-80fd-6a3d7ab4ac1b.jpg "Unit Test")

Navigate to the `/test` folder to review the unit tests for this project. These tests will run as part of your Azure DevOps Build pipeline. See `azure-pipelines.yml` in this repo.

### Start

```
npm start
```


### License

This project is licensed under the Apache License 2.0
