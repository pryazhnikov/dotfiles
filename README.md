# Personal configuration files

File structure:

```
  bin/ - useful CLI commands
  git/ - git configuration & aliases
    hooks/ - some git hook implementations
```

How to deploy:

```shell
# Apply git configuration
./git/configure.sh

# Install git hooks
cp -rv git/hooks/* .git/

# Copy cli commands into ~/bin/
./install.py
```

## CLI Commands (see [`bin/`](bin/))

Available commands:

| Command  | Description  |
| -------- | ------------ |
| `gcm`  | It's a shortcut of `git checkout master`  |
| `gpm`  | It's a shortcut of `git pull origin master`  |
| `gpo`  | It's a shortcut of `git pull origin`  |
| `git-pwd`  | Brief info about repo branch, origin and related JIRA issue  |
| `git-task`  | Find and checkout the branch related to given JIRA issue code/URL  |
| `phpunit-resolver`  | Generate phpunit test run command based on given test name  |

How to use:

```shell
# This env var is mandatory for "git pwd" and "git task"
$ JIRA_URL_PREFIX=https://jiradomain.xyz/browse/

# git pwd: private repo example & feature branch
$ git pwd
Branch: PROJECT-50_branchSuffix
Origin: git@gitdomain.xyz:project.git
Issue:  https://jiradomain.xyz/browse/PROJECT-50

# git pwd: public repo example
$ git pwd
Branch:    master
Origin:    git@github.com:pryazhnikov/dotfiles.git
GitHub:    https://github.com/pryazhnikov/dotfiles/

# git task: multiple branches example (no checkout was made)
$ git task PROJECT-300
Task: 'PROJECT-300'. Multiple branches found: PROJECT-300_branchSuffix PROJECT-300_branchSuffix_copy

# git task: th only branch example (checkout was made)
$ git task https://jiradomain.xyz/browse/PROJECT-777
Task argument preprocessing: 'https://jiradomain.xyz/browse/PROJECT-777' -> 'PROJECT-777'
Branch to checkout:   PROJECT-777_sync

# This env var is optional for "phpunit-resolver"
$ DEFAULT_PHPUNIT_TESTS_PATH=./UTests

# phpunit-resolver: a testcase class only example
$ phpunit-resolver ServerGetUserTest
Looking up files ServerGetUserTest (or ServerGetUserTest) with test

phpunit  ./UTests//bmaFunctional/ServerGetUserTest.php

# phpunit-resolver: a test name example
$ phpunit-resolver ServerGetUserTest::testSpecificUserIdVariations
Looking up files ServerGetUserTest (or ServerGetUserTest) with test testSpecificUserIdVariations

phpunit --filter testSpecificUserIdVariations ./UTests/bmaFunctional/ServerGetUserTest.php

# phpunit-resolver: a test name with data set example
$ phpunit-resolver 'AddPhotosTest::testCanShow with data set "female"' UTests/
Looking up files AddPhotosTest (or AddPhotosTest) with test testCanShow with data set "female"

phpunit --filter 'testCanShow with data set "female"' UTests//_packages/PromoBlock/Banner/AddPhotosTest.php
```
