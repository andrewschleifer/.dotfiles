default:
	@echo WAT?

install: $(shell uname)
	stow bash git vim

Darwin:
	echo "0x08000100:0" > ~/.CFUserTextEncoding
	mkdir -p ~/Library/{Go,Java,Leiningen,Node,Perl,Python,Ruby,Vim/{swap,backup,undo}}

push:
	git push origin public
