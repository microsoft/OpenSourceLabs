# Containers on Azure App Service


## Table of Contents

   * [Containers on Azure App Service](#containers-on-azure-app-service)
      * [Table of Contents](#table-of-contents)
      * [Overview and Pre-Requisites](#overview-and-pre-requisites)
         * [Overview](#overview)
         * [Pre-requisites](#pre-requisites)
         * [Topics Covered](#topics-covered)
      * [Lab](#lab)
         * [Running locally](#running-locally)
         * [Pushing Docker images to Azure Container Registry](#pushing-docker-images-to-azure-container-registry)
         * [Deployment to Azure App Service](#deployment-to-azure-app-service)
         * [Creating CosmosDB database with MongoDB adapter and configuring the Web App](#creating-cosmosdb-database-with-mongodb-adapter-and-configuring-the-web-app)
      * [Conclusion](#conclusion)
      * [End your Lab](#end-your-lab)
      * [Additional Resources and References](#additional-resources-and-references)
      * [License](#license)


## Overview and Pre-Requisites

### Overview

In this lab, you're going to take a MEAN app (MongoDB, Express.js, AngularJS and Node.js) that is "Dockerized" with a Dockerfile and deploy it to Azure App Service (Linux). The Docker image you create will be pushed to an instance of Azure Container Service.

### Pre-requisites

- Docker installed on your machine
    
    On Windows, install Docker for Windows: https://docs.docker.com/docker-for-windows/install/#install-docker-for-windows 
    
    On a Mac, install Docker for Mac: https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac 
    
    Then, verify installation:
    ```
    docker -v
    ```
- Visual Studio Code (or your favorite code editor)
    
    On Windows and Mac, download and install from: https://code.visualstudio.com/Download
    
    Then, verify installation:
    ```
    code --version
    ```

    Install Docker extension for VS Code (optional)
    ![Docker extension for VS Code](../media/ContainersOnAzure/VSCodeDockerExtension.png)

- Azure CLI installed and configured with your Azure subscription
    
    On Windows, download and install from: https://aka.ms/InstallAzureCliWindows 
    On a Mac, run the below command in Terminal
    ```
    curl -L https://aka.ms/InstallAzureCli | bash
    ```

    Then login into your Azure subscription to verify installation:
    ```
    az login
    ```

    If you have many subscriptions, you may choose one:
    ```
    az account set -s <subscription-GUID>
    ```

    Create the Resource Group to use throughout the lab:
    ```
    az group create -n <rg name> -l westeurope 
    ```


### Topics Covered

- Running locally
- Pushing Docker images to Azure Container Registry
- Deployment to Azure App Service
- Creating CosmosDB database with MongoDB adapter and configuring the Web App

## Lab

In the instructions below, replace **<rg name>** with the name of the Resource Group you created earlier.

### Running locally

Clone the current repository to your machine

Open the ```app/Dockerfile``` in your code editor, and review it

Build the image, tagging it as **meantodo**
```
docker build -t meantodo app/.
```

### Pushing Docker images to Azure Container Registry

Create an Azure Container Registry (~2 minutes)
```
az acr create -g <rg name> -n <registry name> --admin-enabled --sku Managed_Standard
```

Login into the registry
```
az acr login -n <registry name>
```

Tag your image locally
```
docker tag <image>:latest <registry name>.azurecr.io/<image>:latest
```

Publish your image to the registry
```
docker push <registry name>.azurecr.io/<image>:latest
```

### Deployment to Azure App Service

Create the App Service Plan
```
az appservice plan create -g <rg name> -n <plan name> --is-linux
```

Create the Web App
```
az webapp create -n <web app name> -p <plan name> -g <rg name>
```

Get the Azure Container Registry credentials
```
az acr credential show -n <registry name> -g <rg name>
```

Update the Web App configuration with Azure Container Registry credentials and container image
```
az webapp config container set -n <web app name> -g <rg name>
--docker-custom-image-name <registry name>.azurecr.io/<image>:latest
--docker-registry-server-url https:// <registry name>.azurecr.io
--docker-registry-username <acr admin username>
--docker-registry-password <acr admin password>
```

Browse to the Web App [http://webappname.azurewebsites.net](http://webappname.azurewebsites.net)

> Notice that you'll find the Web App is not working, since we need to create the MongoDB.

### Creating CosmosDB database with MongoDB adapter and configuring the Web App

In your terminal, type the following command to create the MongoDB database.
```
az cosmosdb create -n <mongo name> -g <rg name> --kind MongoDB
```

Get the MongoDB connection string
```
az cosmosdb list-connection-strings -n <mongo name> -g <rg name>
```

Configure the ```MONGO_URL``` environment variable on the Web App. This is how the application is configured to read the connection string through ```process.env.MONGO_URL```.
```
az webapp config appsettings set -n <web app name> -g <rg name> --settings MONGO_URL="<the connection string>"
```

Now play around with inserting a few items, it should be working.

## Conclusion

In this lab, you created a private Docker image repository on Azure Container Registry and pushed an MEAN application image to it. You also created an App Service Plan running Linux and a Web App that is configured to pull that Docker image. For the database, you created a MongoDB on top of CosmosDB.


## End your Lab

Clean up your lab by deleting the Resource Group you created.
```
az group delete -n <rg name>
```

## Additional Resources and References

- [Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/)
- [Azure App Service Linux](https://docs.microsoft.com/en-us/azure/app-service/app-service-linux-readme)
- [Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/)



## License

Copyright (c) Microsoft Corporation. All rights reserved.

Licensed under the [MIT](LICENSE) License.