default:
	@echo WAT?

install: $(shell uname)
	stow bash git vim

Darwin:
	stow osx
	mkdir -p ~/Library/{Go,Java,Leiningen,Node,Perl,Python,Ruby,Vim/{swap,backup,undo}}

push:
	git push origin public
