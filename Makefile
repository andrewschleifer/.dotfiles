
install:
	ln -sf .dot/CFUserTextEncoding ../.CFUserTextEncoding
	ln -sf .dot/gitconfig ../.gitconfig
	ln -sf .dot/profile ../.profile
	test -d ~/Library && mkdir -p ~/Library/{Java,Leiningen,Python,Vim}
