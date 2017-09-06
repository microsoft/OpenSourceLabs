# Containers on Azure App Service


## Table of Contents

The Table of Contents for the Laboratory document.


## Overview and Pre-Requisites

### Overview

In this lab, you're going to take a MEAN app (MongoDB, Express.js, AngularJS and Node.js) that is "Dockerized" with a Dockerfile and deploy it to Azure App Service (Linux). The Docker images you create will be pushed to an instance of Azure Container Service.

### Pre-requisites

- Docker installed on your machine
    - On Windows, install Docker for Windows: https://docs.docker.com/docker-for-windows/install/#install-docker-for-windows 
    - On a Mac, install Docker for Mac: https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac 
    - Then, verify installation:
    ```
    docker -v
    ```
- Visual Studio Code (or your favorite code editor)
    - On Windows and Mac, download and install from: https://code.visualstudio.com/Download
    - Then, verify installation:
    ```
    code --version
    ```
- Azure CLI installed and configured with your Azure subscription
    - On Windows, download and install from: https://aka.ms/InstallAzureCliWindows 
    - On a Mac, run the below command in Terminal
    ```
    curl -L https://aka.ms/InstallAzureCli | bash
    ```
    - Then login into your Azure subscription to verify installation:
    ```
    az login
    ```
    - If you have many subscriptions, you may choose one:
    ```
    az account set -s <subscription-GUID>
    ```
    - Create the Resource Group to use throughout the lab:
    ```
    az group create -n <rg name> -l westeurope 
    ```


### Topics Covered

Topics covered.


## Laboratory Section

Here is where the content of the lab is added. Several sections and/or subsections can be added.


## Conclusion

A conclusion detailing what was done and any follow-up steps.


## End your Lab

Here it should be explained how to clear, delete and release any used resources so the user doesn't get billed after the lab.


## Additional Resources and References

Any additional resource, links, references should be added here.


### Useful Links

Any useful link for the user.


## License

Copyright (c) Microsoft Corporation. All rights reserved.

Licensed under the [MIT](LICENSE) License.