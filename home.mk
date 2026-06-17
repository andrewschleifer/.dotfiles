MKDIR    := .bin .cache .config
DOTFILES := .bashrc .profile .vim .zprofile .zshenv .zshrc
SYMLINKS := .config/git .config/yt-dlp

UNAME  := $(shell uname -s)

default:
	@echo WAT

ifeq ($(UNAME), Darwin)
all: .cache .config .config/git .vim .zprofile .zshenv .zshrc .bin .CFUserTextEncoding .config/yt-dlp
	mkdir -m 0700 -p ~/Library/{Go,Java/JavaVirtualMachines,Node/packages,Ruby/{packages,versions},Vim/{swap,backup,undo}}
endif

ifeq ($(UNAME), Linux)
all: .cache .config .config/git .vim .bashrc .profile
	mkdir -p ~/.local/share/vim/swap ~/.local/share/vim/backup ~/.local/share/vim/undo
endif

$(MKDIR):
	mkdir -m 0700 $@

$(DOTFILES):
	ln -s $(subst .,.dotfiles/,$@) $@

$(SYMLINKS): | .config
	ln -s ../$(subst .config,.dotfiles,$@) $@

.CFUserTextEncoding:
	printf "0x08000100:0x0" > $@
