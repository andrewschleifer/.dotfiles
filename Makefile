
install: $(shell uname)
	ln -sf .dot/gitconfig ../.gitconfig
	ln -sf .dot/profile ../.profile
	ln -sf .dot/vimrc ../.vimrc

Darwin:
	ln -sf .dot/CFUserTextEncoding ../.CFUserTextEncoding
	test -d ~/Library && ln -sf .dot/tm_properties ../.tm_properties
	test -d ~/Library && mkdir -p ~/Library/{Java,Leiningen,Python,Ruby/cache,Perl,Vim/{swap,backup,undo}}
	test -d ~/Library && mkdir -p ~/Library/KeyBindings && ln -sf ../../.dot/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

push:
	git push origin public
