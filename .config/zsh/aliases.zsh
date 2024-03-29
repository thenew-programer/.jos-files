
# open vim config from anywhere
alias vimrc='vim ${HOME}/.config/nvim/init.lua'
alias bashrc='vim ${HOME}/.bashrc'
alias zshrc='vim ${HOME}/.zshrc'
alias keymap='vim ~/.config/nvim/lua/user/keymaps.lua'
alias cdvim='cd ~/.config/nvim/lua/user'

# git aliases
alias gitad='git add'
alias gitcm='git commit -m'
alias gitrs='git reset'
alias gitrm='git remote'
alias gitps='git push'
alias gitpl='git pull'
alias gitcl='git clone'
alias gitbr='git branch'
alias gitin='git init'
alias gitst='git status'
alias gitch='git checkout'

# Package manager aliases
alias aptin='sudo apt-get install'
alias aptarm='sudo apt autoremove'
alias aptpr='sudo apt purge'
alias aptrm='sudo apt remove'
alias apts='apt search'

# colored ls output
alias md=mkdir
alias ls='ls -AlXu --color'
# alias ls='ll'
alias cl='clear'
alias his='history'
alias shutn='shutdown now -i'

# MySQL alias
alias sqlog='mysql -u jos -p'

# Java alias
alias jc='javac'
alias jr='rm *.class'
alias ja='java'

# https://github.com/sindresorhus/empty-trash-cli
alias rr='rm -irf'
alias mm='mv -i'
alias cc='cp -i'

# use neovim instead of vim
alias vim='nvim'
alias svim='sudo nvim'


# navigate to work folders
alias phpwork='cd /var/www/php/'


bindkey '^ ' autosuggest-accept
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
