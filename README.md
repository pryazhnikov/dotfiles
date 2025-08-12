# Personal configuration files

File structure:

```
  bin/ - useful CLI commands
  git/ - git configuration & aliases
    hooks/ - some git hook implementations
  shell/ - shell configurations
```

How to setup:

```shell
git clone git@github.com:pryazhnikov/dotfiles.git .

# Apply git configuration
./git/configure.sh

# Install git hooks
cp -rv git/hooks/* .git/

# Init directories structure
./shell/init_directories.sh

# Copy cli commands into ~/bin/
./copy_binaries.py

# Apply shell configurations
echo "# ZSH configuration" >> ~/.zshrc
echo "_CONFIG_DIR='$(pwd)/shell'" >> ~/.zshrc
echo ". \$_CONFIG_DIR/_common" >> ~/.zshrc
echo ". \$_CONFIG_DIR/zshrc" >> ~/.zshrc

echo "# Bash configuration" >> ~/.bashrc
echo "_CONFIG_DIR='$(pwd)/shell'" >> ~/.bashrc
echo ". \$_CONFIG_DIR/_common" >> ~/.bashrc
echo ". \$_CONFIG_DIR/bashrc" >> ~/.bashrc

# Use zsh as a default shell
chsh -s $(which zsh)
```

## CLI Commands (see [`bin/`](bin/))

Available commands:

| Command  | Description  |
| -------- | ------------ |
| `gcm`  | It's a shortcut of `git checkout master`  |
| `gpm`  | It's a shortcut of `git pull origin master`  |
| `gpo`  | It's a shortcut of `git pull origin`  |
| `git-optimize`  | Running `git gc` to optimize the size of .git directory  |
| `git-pwd`  | Brief info about repo branch, origin and related JIRA issue  |
| `git-task`  | Find and checkout the branch related to given JIRA issue code/URL  |
| `git-seamless-pull` | Pull with an automatic `git stash` / `git stash pop` calls if needed  |
| `flush-dns`  | A shortcut for MacOS flush DNS commands  |

How to use:

```shell
# This env var is mandatory for "git pwd" and "git task"
$ JIRA_URL_PREFIX=https://jiradomain.xyz/browse/

# git pwd: private repo example & feature branch
$ git pwd
📋  Branch:    PROJECT-50_branchSuffix
📦  Origin:    git@gitdomain.xyz:project.git
🔬  Issue:     https://jiradomain.xyz/browse/PROJECT-50

# git pwd: public repo example
$ git pwd
📋  Branch:    master
📦  Origin:    git@github.com:pryazhnikov/dotfiles.git
🚀  GitHub:    https://github.com/pryazhnikov/dotfiles/

# git task: multiple branches example (no checkout was made)
$ git task PROJECT-300
⚠️  Task: 'PROJECT-300'. Multiple branches found: PROJECT-300_branchSuffix PROJECT-300_branchSuffix_copy

# git task: the only branch example (checkout was made)
$ git task https://jiradomain.xyz/browse/PROJECT-777
✏️  Task argument preprocessing: 'https://jiradomain.xyz/browse/PROJECT-777' -> 'PROJECT-777'
📋  Branch to checkout:   PROJECT-777_sync
Checking out files: 100% (72700/72700), done.
...
🏁  21:22:17 Done!

# git latest-build: checkout the latest build branch
$ git latest-build
⌛️  21:30:24 Data fetch from remote repo...
remote: Counting objects: 69, done.
remote: Compressing objects: 100% (69/69), done.
...
✏️  21:31:05 Matched branch search...
✅  Branch to checkout: build_2018.03.19
Checking out files: 100% (76274/76274), done.
Branch build_2018.03.19 set up to track remote branch build_2018.03.19 from origin.
Switched to a new branch 'build_2018.03.19'
🏁  21:31:40 Done!
