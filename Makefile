default:
	@echo WAT?

install: $(shell uname)
	ln -sf .dot/gitconfig ../.gitconfig
	ln -sf .dot/profile ../.profile
	ln -sf .dot/vimrc ../.vimrc

Darwin:
	ln -sf .dot/CFUserTextEncoding ../.CFUserTextEncoding
	mkdir -p ~/Library/Application\ Support/TextMate && ln -sf ../../../.dot/Global.tmProperties ~/Library/Application\ Support/TextMate
	mkdir -p ~/Library/KeyBindings && ln -sf ../../.dot/DefaultKeyBinding.dict ~/Library/KeyBindings
	mkdir -p ~/Library/{Java,Leiningen,Node,Python,Ruby/cache,Perl,Vim/{swap,backup,undo}}

push:
	git push origin public
