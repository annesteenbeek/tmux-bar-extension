#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

tmpfile="/tmp/.tmux.mem-use.txt"
update_period=$(get_tmux_option "@mem_update_period" 5)

update() {
	cat << _EOF_ > $tmpfile
LAST_TS=$(date +%s)
MEM_USE="$(free -hg | grep Mem: | awk '{ printf $3}' | sed 's/,/\./')"
_EOF_
}

if [ -f "$tmpfile" ]; then
	source $tmpfile
	if [[ $(( $LAST_TS + $update_period )) -lt $(date +%s) ]]; then
		update
	fi
else
	update
fi

printf "$MEM_USE"

