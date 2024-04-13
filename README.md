# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/thenew-programer/.jos-files.git
$ cd .jos-files
```

then run **_bootstrap.sh_**:

```
$ cd scripts
$ chmod 775 bootstrap.sh
$ ./bootstrap.sh
```
if bootstrap runs successfully **run**:
```
$ stow .
```
