#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source "$CURRENT_DIR/helpers.sh"

if [[ $(uname) == "Darwin" ]]; then
		# MEM_USE="$(top -l 1 -s 0 | grep PhysMem | awk '{ printf $2}' | sed 's/G//')"
		# Memory is apperently either hard or slow to get in OSx, so we'll give someting else
		MEM_USE="n/a"
else
		MEM_USE="$(free -hg | grep Mem: | awk '{ printf $3}' | sed 's/,/\./')"
fi

echo "$MEM_USE"
