# Docs for tool configurations and settings

A collection of documentation for tool configurations and settings for both Linux and Windows systems.

## Installing the Windows Subsystem for Linux (WSL).

First, we need to install WSL. Run the terminal as Administrator and execute the following command:

```text
wsl --install
```

Or you can update WSL using the following command:

```text
wsl --update
```

> After the installation or update, you may need to restart your machine before proceeding with the next steps.

After installing WSL, open the terminal again. Now we will install a Linux distribution (in our case, Ubuntu):

```text
wsl --install -d Ubuntu
```

After completing the Ubuntu installation and setting up your username and password, close and reopen the terminal. This time, you will see an Ubuntu option in the menu.

![Terminal Ubuntu](/Tools/assets/terminal-ubuntu-option.png)

Select Ubuntu, and let's update the packages by running the following command:

```bash
sudo apt update && sudo apt upgrade -y
```

And with that, your WSL setup is ready.

> If you want to install some essential tools, along with Docker and K9s, you can follow [this documentation](https://github.com/seripj/OS/blob/main/Linux/README.md).

## Git

- See the [.gitconfig](https://github.com/seripj/OS/blob/main/Tools/git/.gitconfig)

## Visual Studio Code (VSCode)

- See the [user settings.json](https://github.com/seripj/OS/blob/main/Tools/vscode/settings.json)

Extensions installed:

- YAML
- ESLint
- Omni Theme
- Material Icon Theme
- Prettier - Code formatter
- GitLens - Git supercharged
