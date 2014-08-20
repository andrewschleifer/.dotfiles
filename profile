
# FUNCTIONS

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
alias noise='openssl rand 48 -base64 | tr -cd a-hjkp-zACE-HJKP-RT-Z2-4679\n && echo'
alias rsh='ssh -o passwordauthentication=yes -o stricthostkeychecking=no'
alias rcp='scp -o passwordauthentication=yes -o stricthostkeychecking=no'
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
export HISTCONTROL=ignoredups
unset HISTFILE

# PATH

export PATH=${HOME}/.bin
for directory in {/usr,}{/local,/pkg,/X11,}/{,s}bin
do
    if [ -e "$directory" ]; then
       PATH="${PATH}:$directory"
    fi
done
export PATH

# PLATFORM-SPECIFIC

if [ $(uname) = "Darwin" ]; then
    alias top='top -o cpu'
    alias hide='/usr/bin/SetFile -a V'
    export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
    export COPYFILE_DISABLE=true
    export CLASSPATH="${HOME}/Library/Java"
    export LEIN_HOME="${HOME}/Library/Leiningen"
    export GEM_HOME="${HOME}/Library/Ruby"
    export PERL_MB_OPT="--install_base ${HOME}/Library/Perl";
    export PERL_MM_OPT="INSTALL_BASE=${HOME}/Library/Perl";
    export PERL5LIB="${HOME}/Library/Perl/lib/perl5";
    export PYTHONPATH="${HOME}/Library/Python"
fi

# INTERACTIVE

if [ -n "$PS1" ]; then
    test 5 -eq $(expr "$TERM" : "xterm") && \
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    PS1='\[\e[1;37m\]\\$ \[\e[0m\]'
    PS2='\[\e[1;37m\]... \[\e[0m\]'
    shopt -s cmdhist histverify nocaseglob
    complete -d cd
    complete -c man which
    complete -c -f sudo
    complete -W '$(git branch -a 2>/dev/null | awk "{print $NF}")' -f git
    complete -W '$(_known_hosts_list)' ping
    complete -W '$(_known_hosts_list)' ssh
    complete -W '$(_known_hosts_list)' -f scp
    complete -W '$(_makefile_target_list)' make
fi
