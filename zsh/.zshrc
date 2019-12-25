
# FUNCTIONS

_available()
{
    [ -x "$(command -v "$1")" ]
}

# ALIASES

unalias -a
alias ..='cd ..'
alias c='cd'
alias cal='cal -N'
alias canto='say -v Sin-ji'
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
alias hide='/usr/bin/SetFile -a V'
alias hsot='host'
alias l='ls'
alias less='less -S#2'
alias ll='ls -lah'
alias m='more'
alias maek='make'
alias mv='mv -i'
alias noise='printf $(openssl rand 128 -base64 | tr -cd a-hjkp-zACE-HJKP-RT-Z2-4679)\\n'
alias rcp='scp -o passwordauthentication=yes -o stricthostkeychecking=no'
alias rsh='ssh -o passwordauthentication=yes -o stricthostkeychecking=no'
alias tag='/usr/local/bin/ctags -f .tags --exclude=.git -R'
alias top='top -o cpu'

# ENVIRONMENT

PS1='%B%(!.#.$)%b '
PS2='%B...%b '
unset HISTFILE

# INTERACTIVE

xterm-title() {
	print -Pn '\e]2;%n@%m:%~\a'
}

if [[ "$TERM" = "(screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*)" ]]; then
	add-zsh-hook -Uz precmd xterm-title
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit -i -d "${HOME}.cache/zsh/compdump"

_available nodenv && eval "$(nodenv init -)"
_available rbenv && eval "$(rbenv init -)"

#    shopt -s cmdhist histverify nocaseglob
#    complete -W '$(git branch -a 2>/dev/null | awk "{print $NF}")' -f git
#    complete -W '$(_known_hosts_list)' curl host ping ssh
#    complete -W '$(_known_hosts_list)' -f scp
#    complete -W '$(_makefile_target_list)' make

