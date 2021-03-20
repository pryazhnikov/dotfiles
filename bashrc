# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

###
# Path configuration
###
if [ -d ~/bin ]; then
    PATH=$PATH:~/bin
    #echo $PATH
fi

###
# Helper functions
###

# "main" => " (main)"
parse_git_branch() {
    git branch --show-current 2>/dev/null \
        | sed -e 's/^\(.*\)/ \(\1\)/'
}

###
# Environments configuration
###

export PS1="\[\e[4;32m\]@\h \w/\$(parse_git_branch)\[\e[4;32m\]\$\[\e[0m\] "
export PS2="\[\e[4;32m\] >\[\e[0m\] "
export MYSQL_PS1='[\h] \d> '

export EDITOR=vi
export PAGER=less

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE

export GREP_COLOR='7;36'

export LESS='--RAW-CONTROL-CHARS --ignore-case'

###
# Aliases configuration
###

# find
alias fd='find . -type d -not -path "*/.svn*" -not -path "*/.git*" -not -path "*/.hg/*"'
alias ff='find . -type f -not -path "*/.svn/*" -not -path "*/.git/*" -not -path "*/.hg/*"'
alias fl='find . -type l'

## grep
alias grep='grep --color=auto'
alias zgrep='zgrep --color=auto'

# git
alias gg='git grep --line-number'
alias gco='git checkout'
alias gnb='git checkout -b'
alias gti='git'

# ls
alias l.='ls -dFG .*'
alias la='ls -lhAFG'
alias ll='ls -lhFG'

# mysql
alias my='mysql -A'

# xargs
alias xa='xargs'
alias xg='xargs grep'
alias xgn='xargs grep -n'

# Other aliases (no specific group)
alias df='df -ih'
alias du='du -h'
alias tf='tail -F'
alias wl='wc -l'

###
# Unversioned configuration
# It should be placed at the end of file to make it possible to override everything
###
if [ -f ~/.bashrc_local ]; then
    #echo "Reading local bashrc config"
    source ~/.bashrc_local
fi
