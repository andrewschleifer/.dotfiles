
# FUNCTIONS

_available()
{
    [ -x "$(command -v $1)" ]
}

_known_hosts_list()
{
    cat ~/.ssh/known_hosts | cut -f 1 -d\  | tr , \\n | sort -u | grep \\.
}

_makefile_target_list()
{
    make -qp 2>/dev/null | sed -n -e 's/^\([^.#%0([:space:]][^:[:space:]]*\):.*/\1/p'
}

# ALIASES

unalias -a
alias ..='cd ..'
alias c='cd'
alias cp='cp -i'
alias df='df -h'
alias du='du -hsc'
alias easy_install='easy_install -d ${PYTHONPATH%:*}'
alias got='git'
alias gti='git'
alias grpe='grep'
alias gerp='grep'
alias gpg='GPG_TTY=$(tty) gpg'
alias hsot='host'
alias l='ls'
alias ll='ls -la'
alias less='less -S#2'
alias m='more'
alias maek='make'
alias mv='mv -i'
alias noise='printf $(openssl rand 128 -base64 | tr -cd a-hjkp-zACE-HJKP-RT-Z2-4679)\\n'
alias rsh='ssh -o passwordauthentication=yes -o stricthostkeychecking=no'
alias rcp='scp -o passwordauthentication=yes -o stricthostkeychecking=no'
alias tag='/usr/local/bin/ctags -f .tags --exclude=.git -R'

# ENVIRONMENT

export CVS_RSH=ssh
export EDITOR=vi
export GNUPGHOME="${HOME}/Documents/GnuPG"
export LC_CTYPE=en_US.UTF-8
export PAGER=less
export RSYNC_RSH=ssh
export INPUTRC="${HOME}/.dot/inputrc"
export LESSHISTFILE=-
export GDBHISTFILE=-
export HISTIGNORE="&:l[als]:[bf]g:cd:pwd:clear"
export HISTCONTROL=ignoredups
unset HISTFILE

# PATH

PATH=${HOME}/.bin
for directory in {/usr,}{/local,/pkg,/X11,}/{s,}bin; do
    test -d "$directory" && PATH="${PATH}:$directory"
done
export PATH

# PLATFORM-SPECIFIC

LOCAL="${HOME}/.dot/profile.d/$(uname -s)"
test -f "$LOCAL" && source "$LOCAL"

# INTERACTIVE

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
    _available rbenv && eval "$(rbenv init -)"
fi
