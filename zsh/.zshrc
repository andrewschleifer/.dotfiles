
# FUNCTIONS

. ${HOME}/.dotfiles/_functions.sh

# ALIASES

unalias -a

. ${HOME}/.dotfiles/_alias.sh

alias cal='cal -N'
alias canto='say -v Sin-ji'
alias hide='/usr/bin/SetFile -a V'
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

if [[ "$TERM" = (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*) ]]; then
	add-zsh-hook -Uz precmd xterm-title
fi

bindkey -e

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit -i -d "${HOME}.cache/zsh/compdump"

_available nodenv && eval "$(nodenv init -)"
_available rbenv && eval "$(rbenv init -)"

#    shopt -s cmdhist histverify nocaseglob
#    complete -W '$(git branch -a 2>/dev/null | awk "{print $NF}")' -f git
#    complete -W '$(_known_hosts_list)' curl host ping ssh
#    complete -W '$(_known_hosts_list)' -f scp
#    complete -W '$(_makefile_target_list)' make

