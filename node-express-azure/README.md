# Node & Express Demo App for Azure DevOps

> Build Your First CI/CD Pipeline using Azure DevOps with this Demo App.

This is a Node and Express web application used to demonstrate CI/CD with Azure DevOps. You can clone this repo and use it within Azure DevOps to build, test, and release to an Azure App Service web app.

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

## Deploy the App Service Infrastructure:

Click the button below to deploy an Azure Web App for Linux. This will create a new app service plan and web app with a dev deployment slot. You can then create build and release pipelines at dev.azure.com to continuously deploy the node application in this repo to the dev deployment slot.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmikepfeiffer%2Fnode-express-azure%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Deploy the App Continuously with Azure DevOps:
Follow my step-by-step guide: [Build Your First CI/CD Pipeline using Azure DevOps](https://mikepfeiffer.io/azure-devops-pipeline.html)

This walkthrough contains all the steps you should follow to fork this repo and build your own automated build and release pipeline.

## App Info

### Author

Mike Pfeiffer
[@mike_pfeiffer](https://twitter.com/mike_pfeiffer)

### Version

1.0.0

### License

This project is licensed under the Apache License 2.0
