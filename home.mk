UNAME = $(shell uname -s)
COMMON = .cache .config .config/git .vim

ifeq ($(UNAME), Darwin)
home: $(COMMON) .bin .CFUserTextEncoding .config/yt-dlp .zprofile .zshenv .zshrc
	mkdir -m 0700 -p ~/Library/{Go,Java/JavaVirtualMachines,Python,Ruby,Vim/{swap,backup,undo}}
endif
ifeq ($(UNAME), Linux)
home: $(COMMON) .profile
	mkdir -p ~/.local/share/vim/swap ~/.local/share/vim/backup ~/.local/share/vim/undo
endif

.bin .cache .config:
	mkdir -p 0700 $@

.config/git: | .config
	ln -s ../.dotfiles/git $@

.config/yt-dlp: | .config
	ln -s ../.dotfiles/yt-dlp $@

.vim:
	ln -s .dotfiles/vim $@

.zprofile:
	ln -s .dotfiles/zprofile $@

.zshenv:
	ln -s .dotfiles/zshenv $@

.zshrc:
	ln -s .dotfiles/zshrc $@

.CFUserTextEncoding:
	printf "0x08000100:0x0" > $@
