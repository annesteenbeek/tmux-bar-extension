#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source "$CURRENT_DIR/helpers.sh"

# tmpfile="/tmp/.tmux.load-avg.txt"
# update_period=$(get_tmux_option "@load_update_period" 5)

# update() {
	# cat << _EOF_ > $tmpfile
# LAST_TS=$(date +%s)
# LOAD_AVG="$(cat /proc/loadavg | awk '{ printf "%.1f %.1f %.1f", $1, $2, $3 }')"
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

# LOAD_AVG="$(cat /proc/loadavg | awk '{ printf "%.1f %.1f %.1f", $1, $2, $3 }')"
LOAD_AVG="$(cat /proc/loadavg | awk '{ printf "%.1f", $1 }' | sed -r 's/,/./g')"
echo "$LOAD_AVG"

