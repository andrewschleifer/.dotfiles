case $- in
	*i* )
		if command -v bash > /dev/null; then
				bash --version > /dev/null && exec bash
				echo "Couldn't run 'bash'" > /dev/stderr
		fi
		;;
esac
