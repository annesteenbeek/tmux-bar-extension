#!/usr/bin/env bash

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source "$CURRENT_DIR/helpers.sh"
if [[ $(uname) == "Darwin" ]]; then
		default_route_nic=$(route get default | grep -i interface | awk '{print $2}')
		all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }' | tr '\n' ' ')
		IFS=' ' read -ra all_nics_array <<< "$all_nics"
		# the nic of the default route is considered first
		all_nics_array=("$default_route_nic" "${all_nics_array[@]}")
		for nic in "${all_nics_array[@]}"; do
			ipv4s_on_nic=$(ifconfig "${nic}" 2>/dev/null | awk '$1 == "inet" { print $2 }')
			for LAN_IP in "${ipv4s_on_nic[@]}"; do
				[[ -n "${LAN_IP}" ]] && break
			done
			[[ -n "${LAN_IP}" ]] && break
		done
else
    LAN_IP=$(hostname -I | awk '{print $1}')
fi

echo ${LAN_IP-N/a}

