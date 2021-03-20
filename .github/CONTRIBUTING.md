# Contributing Guide

This is a naive template of the contributing guide.

## CLI commands

All CLI commands are stored at `bin/` directory. Each command file MUST be added into files allow list at `install.py` to be deployed into `~/bin/`.

It's a good idea to use emoji at CLI commands output to make it easier to read.

Recommended emojis:

| Emoji  | How to use  |
| ------ | ------------ |
| ✅  | at success messages  |
| ⚠️  | at warning messages  |
| ❌  | at error messages  |
| ⌛️  | before starting a time consuming operation  |
| 💣  | before starting a dangerous operation  |
| 🏁  | at the successful finish of the command run  |
