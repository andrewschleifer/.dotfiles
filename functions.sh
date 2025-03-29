noise()
{
	printf "%s\n" $(openssl rand -base64 ${1:-64} | tr -cd a-hjkp-zACE-HJKP-RT-Z2-4679)
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
