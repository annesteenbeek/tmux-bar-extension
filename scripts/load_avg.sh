#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source "$CURRENT_DIR/helpers.sh"

if [[ $(uname) == "Darwin" ]]; then
		LOAD_AVG="$(sysctl -n vm.loadavg | awk '{ printf "%.2f", $2 }')"
else
		LOAD_AVG=$(< /proc/loadavg awk '{ printf "%.1f", $1 }')
fi
echo "$LOAD_AVG"

