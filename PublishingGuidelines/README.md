# Microsoft Open Source Labs Publishing Guidelines

## Table of Contents

   * [Microsoft Open Source Labs Publishing Guidelines](#microsoft-open-source-labs-publishing-guidelines)
      * [Minimum Requirements](#minimum-requirements)
      * [Content](#content)
         * [TOC script](#toc-script)
      * [How to create a lab repository?](#how-to-create-a-lab-repository)
      * [Git repository best practices](#git-repository-best-practices)
         * [Development Branch](#development-branch)
         * [Staging Branch](#staging-branch)
         * [Master Branch](#master-branch)
         * [Tags / Deployments](#tags--deployments)
            * [Deploy script](#deploy-script)
      * [Contributing](#contributing)


## Minimum Requirements

Each laboratory needs to include the following files as a minimum to be deployed:

1. A *LICENSE* file with an MIT License template.
2. A *README.md* Markdown file with the description (step-by-step) of the laboratory. You can find a description of the Markdown syntax [here](https://guides.github.com/features/mastering-markdown/).
3. Any other supporting documents, file, source code, etc.

## Storing of the labs

### Naming conventions

The laboratory name in the directory should be stored without any spaces or symbols in a Upercase first mode. For example the lab *Containers with ACS in Azure* name should be stored as `ContainersWithACSInAzure`.

### Storage conventions

Each lab should be stored in a separate folder structure in the repository inside one of the following directories:

* ApplicationModernization
* InfrastructureModernization
* DataModernization

For example a laboratory on *Containers with ACS in Azure* should be stored in `ApplicationModernization/ContainersWithACSInAzure`.

## Content

In order to maintain a standardized repository of laboratories, there is some content that needs to be included in every laboratory. This sections are required:

<dl>

  <dt>Table of Contents</dt>
  <dd>The Table of Contents for the Laboratory document.</dd>

  <dt>Overview and Pre-Requisites</dt>
  <dd>An Overview of the scope of the lab, any pre-requisites and topics covered on the lab should be clearly explained here.</dd>

  <dt>Laboratory section(s)</dt>
  <dd>Here is where the content of the lab is added. Several sections and/or subsections can be added.</dd>

  <dt>Conclusion</dt>
  <dd>A conclusion detailing what was done and any follow-up steps.</dd>

  <dt>End your Lab</dt>
  <dd>Here it should be explained how to clear, delete and release any used resources so the user doesn't get billed after the lab.</dd>

  <dt>Additional Resources and References</dt>
  <dd>Any additional resource, links, references should be added here.</dd>

  <dt>License</dt>
  <dd>The licensing and copyright information</dd>

</dl>

#### TOC script

The publishing guideline contains a script that will help you to create a **Table of Contents** from your MarkDown file.

Please copy `scripts/gh-md-toc` script to the root of your lab repository, the script can be executed using the command:

     # ./gh-md-toc README.md

This will output to screen a auto-generated table of contents that can be copy and pasted into your README.md file.

## How to create a lab repository?

As a team member you have access to create a new lab by cloning this repository and following the **Storage Conventions** for the lab.

The initial skeleton of the lab should include the `skeleton/template.md` template file and the `LICENSE` file.
 

## Git repository best practices 

> Some of the best practices and recommendations described in this guide in terms of *Git Branching Strategy* are based from this model: [http://nvie.com/posts/a-successful-git-branching-model/](http://nvie.com/posts/a-successful-git-branching-model/)

The branching strategy recommended to maintain your Lab follows a three-stages and tagging approach.

In order to create a new branch, you can run the following command:

     # git branch -b NAME_OF_BRANCH

In order to jump into your new branch, you can run the command:

     # git checkout NAME_OF_BRANCH


### Development Branch

The `development` branch is the current *working* branch, current changes and updates will be done here.


### Staging Branch

The `staging` branch will give us a *preview* of a new release of the lab.

In order to commit your development changes from `development` to `staging`, you can use:

     # git checkout staging
     # git merge --no-ff development


### Master Branch

The `master` branch is the latest stable release of the lab.


### Tags / Deployments

Each `master` branch commit needs to be `tagged`, so users can easily browse previous versions of the lab content.


#### Deploy script

The publishing guideline contains a script that will help you automate the steps mentioned above to commit to the `master` branch and create a new tag/deployment.

Please copy `scripts/deploy.sh` script to the root of your lab repository, the script can be executed using the command:

     # ./deploy.sh -v "NEW_VERSION" -m "COMMENT"

Where `NEW_VERSION` is the name of the version or tag to be used and  `COMMENT` is a note for the commit.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

Please report any bug or issue on the labs trough the [GitHub Issues Page](https://github.com/Microsoft/OpenSourceLabs/issues) page.