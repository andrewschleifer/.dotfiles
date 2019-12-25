
# FUNCTIONS

_available()
{
    [ -x "$(command -v "$1")" ]
}

_known_hosts_list()
{
    cat ${HOME}/.ssh/known_hosts | cut -f 1 -d\  | tr , \\n | sort -u | grep \\.
}

_makefile_target_list()
{
    make -qp 2>/dev/null | sed -n -e 's/^\([^.#%0([:space:]][^:[:space:]]*\):.*/\1/p' | grep -v Makefile
}

# ALIASES

unalias -a
alias ..='cd ..'
alias c='cd'
alias cal='cal -N -M'
alias car='awk "{print \$1}"'
alias cd..='cd ..'
alias cp='cp -i'
alias df='df -h'
alias du='du -hsc'
alias easy_install='easy_install -d ${PYTHONPATH%:*}'
alias gerp='grep'
alias got='git'
alias grpe='grep'
alias gti='git'
alias hsot='host'
alias l='ls'
alias less='less -S#2'
alias ll='ls -lah'
alias m='more'
alias maek='make'
alias mv='mv -i'
alias noise='printf $(openssl rand 128 -base64 | tr -cd a-hjkp-zACE-HJKP-RT-Z2-4679)\\n'
alias r='R --no-save'
alias rcp='scp -o passwordauthentication=yes -o stricthostkeychecking=no'
alias rsh='ssh -o passwordauthentication=yes -o stricthostkeychecking=no'
alias tag='/usr/local/bin/ctags -f .tags --exclude=.git -R'
alias vi='vim'

# ENVIRONMENT

export B2_ACCOUNT_INFO="${HOME}/.cache/b2"
export CVS_RSH=ssh
export EDITOR=vi
export GDBHISTFILE=-
export GOPATH="${HOME}/lib/go"
export HISTCONTROL=ignoredups
export HISTIGNORE="&:l[als]:[bf]g:cd:pwd:clear"
export LC_CTYPE=en_US.UTF-8
export LESSHISTFILE=-
export MOTHERSHIP_CACHE="${HOME}/.cache/mothership"
export PAGER=less
export RBENV_ROOT="${HOME}/lib/ruby"
export RSYNC_RSH=ssh
export STSCLIENT_CACHE="${HOME}/.cache/stsclient"
unset HISTFILE

# INTERACTIVE

export PATH="${HOME}/bin:$PATH/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ -n "$PS1" ]; then
    PS1='\[\033]0;\u@\H\007\]\[\e[1;37m\]\$\[\e[0m\] '
    PS2='\[\e[1;37m\]... \[\e[0m\]'
    shopt -s cmdhist histverify nocaseglob
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
    _available ssh-agent && eval "$(ssh-agent -s)"
    trap '/usr/bin/ssh-agent -k' 0
fi

