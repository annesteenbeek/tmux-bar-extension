#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

default_ip="#($CURRENT_DIR/scripts/default_ip.sh)"

default_ip_interpolation="\#{default_ip}"

do_interpolation() {
	local input=$1
    local result=""

	result=${input/$default_ip_interpolation/$default_ip}
	# result=${result/$net_interpolation/$net_speed}
	# result=${result/$upload_interpolation/$upload_speed}

	echo $result
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main