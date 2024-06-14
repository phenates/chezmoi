## Installation

### Alpine
```
# apk add chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
# julie-setup
```

### FreeBSD
```
# pkg install chezmoi
$ chezmoi init --apply juliekoubova --source ~/dotfiles
```
### MacOS
```
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
% brew install chezmoi
% chezmoi init --apply juliekoubova --source ~/dotfiles
```
### Windows
```
C:\src\> winget install --id twpayne.chezmoi
C:\src\> chezmoi init --apply juliekoubova --source C:\src\dotfiles
```

## Write Access
1. Generate an SSH key if there isn't one yet.

    ```
    # ssh-keygen -t ed25519
    # cat ~/.ssh/id_ed25519.pub | wlcopy
    ```
2. Go to [Settings > SSH and GPG keys](https://github.com/settings/keys) and add it there.
   
3. Change the repo's `origin` remote to use SSH:

    ```
    # git remote set-url origin git@github.com:juliekoubova/dotfiles.git
    ```
