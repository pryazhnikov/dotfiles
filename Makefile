# Default target
.PHONY: all
all: help

# Show help for each target
.PHONY: help
help:
	@echo "Available commands"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  make %-15s - %s\n", $$1, $$2}'

.PHONY: install
install: git-config git-hooks dir-init copy-binaries ## Run all installation steps

.PHONY: git-config
git-config: ## Configure git settings
	@echo "Configuring git..."
	./git/configure.sh

.PHONY: git-hooks
git-hooks: ## Install git hooks for the repo
	@echo "Installing git hooks..."
	cp -rv git/hooks/* .git/

dir-init: ## Initialize directory structure
	@echo "Initializing directory structure..."
	./shell/init_directories.sh

copy-binaries: ## Copy CLI commands to ~/bin/
	@echo "Installing CLI commands..."
	./copy_binaries.py
