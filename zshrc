
# FUNCTIONS

. ${HOME}/.dotfiles/functions.sh

# ALIASES

unalias -a

. ${HOME}/.dotfiles/aliases.sh

alias cal='cal -N'
alias canto='say -v Sin-ji'
alias hide='/usr/bin/SetFile -a V'
alias love="${HOME}/Applications/love.app/Contents/MacOS/love"
alias tag='/usr/local/bin/ctags -f .tags --exclude=.git -R'
alias top='top -o cpu'

# ENVIRONMENT

PS1='%B%(!.#.$)%b '
PS2='%B...%b '
unset HISTFILE

# INTERACTIVE

# zmodload zsh/zprof
autoload -Uz add-zsh-hook

xterm-title() {
	print -Pn '\e]2;%n@%m:%~\a'
}

if [[ "$TERM" = (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*) ]]; then
	add-zsh-hook -Uz precmd xterm-title
fi

unsetopt auto_menu
setopt nocaseglob
bindkey -e

_available nodenv && eval "$(nodenv init -)"
_available rbenv && eval "$(rbenv init -)"

zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

autoload -Uz select-word-style
select-word-style bash

autoload -Uz compinit
compinit -i -d ${HOME}/.cache/zsh/compdump
