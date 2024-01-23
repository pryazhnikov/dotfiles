#!/bin/sh
set -e

create_directory() {
    local dirname="$1"

    if [[ ! -d "$dirname" ]]; then
        mkdir -vp "$dirname"
    else
        echo "Directory $dirname already exists, nothing to do here"
    fi
}

create_symlink() {
    local dirpath="$1"
    local linkpath="$2"

    # Error case processing
    if [[ ! -d "$dirpath" ]]; then
        echo "Directory $dirpath does not exist, cannot create a link" >&2
        exit 1
    fi

    # Happy ways
    if [[ -h "$linkpath" ]]; then
        echo "Symlink $linkpath already exists, nothing to do here"
    else
        ln -vhs "$dirpath" "$linkpath"
    fi
}

# Custom binaries
create_directory ~/bin

# Project directories
PROJECTS_DIR=~/Desktop/Projects

echo "\nStage #1: Project directories creating..."

create_directory "$PROJECTS_DIR"
create_directory "$PROJECTS_DIR/Badoo"
create_directory "$PROJECTS_DIR/Patches"
create_directory "$PROJECTS_DIR/_personal"
create_directory "$PROJECTS_DIR/_temporary"

# Shortcuts for project directories
# (see also: aliases which are defined in configuration)
echo "\nStage #2: linking..."

create_symlink "$PROJECTS_DIR/" ~/p
create_symlink "$PROJECTS_DIR/Patches/" ~/Patches
create_symlink "$PROJECTS_DIR/Badoo/" ~/BD

echo "\nDone"
