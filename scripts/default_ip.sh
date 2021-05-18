#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source "$CURRENT_DIR/helpers.sh"

# tmpfile="/tmp/.tmux.default-ip.txt"
# update_period=$(get_tmux_option "@ip_update_period" 60)

# update() {
	# cat << _EOF_ > $tmpfile
# LAST_TS=$(date +%s)
# IP_ADDR=$(hostname -I | awk '{print $1}')
# _EOF_
# }

# if [ -f "$tmpfile" ]; then
    # source $tmpfile
    # if [[ $(( $LAST_TS + $update_period )) -lt $(date +%s) ]]; then
        # update
    # fi
# else
    # update
# fi

IP_ADDR=$(hostname -I | awk '{print $1}')
printf "$IP_ADDR"

