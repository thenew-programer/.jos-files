#!/bin/sh
export EDITOR="nvim"
export BROWSER="brave"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=/usr/local/go/bin/go
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/sqlite3:$PATH
export PATH=$HOME/.nvm/versions/node/v20.5.0/bin:$PATH
export PATH=$HOME/nvim/bin:$PATH
export PATH="$HOME/.local/bin":$PATH
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:$HOME/Android/Sdk/platform-tools

eval "`pip completion --zsh`"

