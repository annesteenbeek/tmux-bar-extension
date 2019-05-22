#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

tmpfile="/tmp/.tmux.public-ip.txt"
update_period=60

update() {
	cat << _EOF_ > $tmpfile
LAST_TS=$(date +%s)
IP_ADDR=$(ip route show | grep "default via[^6]" | awk '{print $3}')
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

source $tmpfile
# printf $IP_ADDR
printf "hello"

