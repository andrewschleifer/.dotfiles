
# FUNCTIONS

. ${HOME}/.dotfiles/_functions.sh

# ALIASES

unalias -a

. ${HOME}/.dotfiles/_alias.sh

alias cal='cal -N -M'
alias vi='vim'

# ENVIRONMENT

. ${HOME}/.dotfiles/_environ.sh

export CDCK_STSCLIENT_ACCOUNTS_PATH="${HOME}/src/ops/etc/stsclient"
export DISCOURSE_REPO_BASE_DIRECTORY="${HOME}/src"
export DSSH_CONTROL_PATH_BASE="${HOME}/.ssh/socket.d"
export GOPATH="${HOME}/lib/go"
export GPG_TTY=$(tty)
export HISTCONTROL=ignoredups
export HISTIGNORE="&:l[als]:[bf]g:cd:pwd:clear"
export MOTHERSHIP_CACHE="${HOME}/.cache/mothership"
export RBENV_ROOT="${HOME}/lib/ruby"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

unset HISTFILE

# INTERACTIVE

export PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ -n "$PS1" ]; then
    PS1='\[\033]0;\u@\H:\w\007\]\[\e[1;37m\]\$\[\e[0m\] '
    PS2='\[\e[1;37m\]... \[\e[0m\]'
    shopt -s cmdhist histverify nocaseglob
    stty -ixon
    complete -d cd
    complete -c man which
    complete -c -f sudo
    complete -W '$(git branch -a 2>/dev/null | awk "{print $NF}")' -f git
    complete -W '$(_known_hosts_list)' curl host ping ssh
    complete -W '$(_known_hosts_list)' -f scp
    complete -W '$(_makefile_target_list)' make
    _available aws_completer && complete -C aws_completer aws
    _available nodenv && eval "$(nodenv init -)"
    _available rbenv && eval "$(rbenv init -)"
fi

