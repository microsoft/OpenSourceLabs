# Microsoft Open Source Labs

## Cloning this repository

This repository contains [submodules](https://github.com/blog/2104-working-with-submodules).

Git expects us to explicitly ask it to download the submodule's content. You can use `git submodule update --init --recursive` here as well, but if you're cloning this repository for the first time, you can use a modified clone command to ensure you download everything, including any submodules:

```
git clone --recursive git@github.com:Microsoft/OpenSourceLabs.git
```

## Updating latest changes from submodules

In order to updated the repository submodules content, you cna execute the following command regularly:

```
git submodule update --remote --recursive
```

## Adding a submodule

Adding a submodule to point to an external repository is simple. Please use this command to add a new submodule to this repository:

```
git submodule add [Repository Url] [Directory to Add the submodule]
```

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