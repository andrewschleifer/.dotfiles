
# FUNCTIONS

available()
{
    type "$1" >/dev/null 2>&1
}

_known_hosts_list()
{
    cat ~/.ssh/known_hosts | cut -f 1 -d\  | tr , \\n | sort -u | grep \\.
}

# ALIASES

unalias -a
alias ..='cd ..'
alias cp='cp -i'
alias df='df -h'
alias du='du -hsc'
alias easy_install='easy_install -d ${PYTHONPATH}'
alias gitx='gitx --all'
alias got='git'
alias gti='git'
alias grpe='grep'
alias gerp='grep'
alias l='ls'
alias ll='ls -la'
alias less='less -S#2'
alias m='more'
alias mv='mv -i'
alias noise='openssl rand 1024 | openssl sha1'
alias root='sudo -i'
alias tarsnap="tarsnap --configfile ${HOME}/.dot/tarsnap.conf"
alias vbox='VBoxManage'

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
export HISTCONTROL=ignoreboth
unset HISTFILE

# PATH

unset PATH
for directory in \
    ${HOME}/{,.}bin \
    /opt/local/{,s}bin \
    /usr/local/{,s}bin \
    /usr/pkg/{,s}bin \
    /usr/X11{,R6}/{,s}bin \
    /usr/{,s}bin \
    /{,s}bin \
    /Developer/Tools \
    /usr/games
do
    if [ -e "$directory" ]; then
       if [ -z "$PATH" ]; then
           PATH="$directory"
       else
           PATH="${PATH}:$directory"
       fi
    fi
done
export PATH

# PLATFORM-SPECIFIC

if [ $(uname) = "Darwin" ]; then
    alias root='su administrator -c "sudo sh"'
    alias top='top -o cpu'
    alias diff='ksdiff'
    alias hide='/usr/bin/SetFile -a V'
    export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
    export COPYFILE_DISABLE=true
    export PYTHONPATH="${HOME}/Library/Python"
    export CLASSPATH="${HOME}/Library/Java"
    export LEIN_HOME="${HOME}/Library/Leiningen"
fi

if [ -f /Library/ArchMac/etc/profile ]; then
   . /Library/ArchMac/etc/profile
fi

# INTERACTIVE

if [ -n "$PS1" ]; then
    test 5 -eq $(expr "$TERM" : "xterm") && \
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    PS1='\[\e[1;37m\]% \[\e[0m\]'
    PS2='\[\e[1;37m\]... \[\e[0m\]'
    shopt -s cmdhist histverify nocaseglob
    complete -d cd
    complete -c man which
    complete -c -f sudo
    complete -W '$(git branch -a 2>/dev/null | awk "{print $NF}")' -f git
    complete -W '$(_known_hosts_list)' ping
    complete -W '$(_known_hosts_list)' ssh
    complete -W '$(_known_hosts_list)' -f scp
fi
