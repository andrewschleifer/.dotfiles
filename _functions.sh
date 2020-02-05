wk()
{
	case $# in
		1)
			cd $HOME/Work/$(($1 - $1 % 10))\ */$1\ */
			;;
		2)
			cd $HOME/Work/$(($1 - $1 % 10))\ */$1\ */$1.$2\ */
			;;
		*)
			echo WAT
			;;
	esac

}

_available()
{
	[[ -x "$(command -v "$1")" ]]
}

_known_hosts_list()
{
	cat ${HOME}/.ssh/known_hosts | cut -f 1 -d\  | tr , \\n | sort -u | grep \\.
}

_makefile_target_list()
{
	make -qp 2>/dev/null | sed -n -e 's/^\([^.#%0([:space:]][^:[:space:]]*\):.*/\1/p' | grep -v Makefile
}
