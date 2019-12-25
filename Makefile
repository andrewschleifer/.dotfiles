default:
	@echo WAT?

install: $(shell uname)
	stow git vim

Linux:
	stow bash
	mkdir -p ~/.local/share/vim/swap ~/.local/share/vim/backup ~/.local/share/vim/undo

Darwin:
	stow zsh
	echo "0x08000100:0" > ~/.CFUserTextEncoding
	mkdir -p ~/Library/{Go,Java/JavaVirtualMachines,Python,Ruby,Vim/{swap,backup,undo}}

push:
	git push origin public
