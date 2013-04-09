
install:
	ln -sf .dot/CFUserTextEncoding ../.CFUserTextEncoding
	ln -sf .dot/gitconfig ../.gitconfig
	ln -sf .dot/profile ../.profile
	ln -sf .dot/vimrc ../.vimrc
	test -d ~/Library && mkdir -p ~/Library/{Java,Leiningen,Python}
	test -d ~/Library && mkdir -p ~/Library/Vim/{swap,backup,undo}
	test -d ~/Library && mkdir -p ~/Library/KeyBindings && ln -sf ../../.dot/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
