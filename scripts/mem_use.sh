#!/usr/bin/env bash
LC_NUMERIC="en_US.UTF-8"

# CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# source "$CURRENT_DIR/helpers.sh"

sum_macos_vm_stats() {
  grep -Eo '[0-9]+' |
    awk '{ a += $1 * 4096 } END { print a }'
}

ram_percentage_format="%3.1f%%"


if [[ $(uname) == "Darwin" ]]; then
		# MEM_USE="$(top -l 1 -s 0 | grep PhysMem | awk '{ printf $2}' | sed 's/G//')"
		# Memory is apperently either hard or slow to get in OSx, so we'll give someting else
		# MEM_USE="n/a"
		# page size of 4096 bytes
    stats="$(vm_stat)"

    used_and_cached=$(
      echo "$stats" |
        grep -E "(Pages active|Pages inactive|Pages speculative|Pages wired down|Pages occupied by compressor)" |
        sum_macos_vm_stats
    )

    cached=$(
      echo "$stats" |
        grep -E "(Pages purgeable|File-backed pages)" |
        sum_macos_vm_stats
    )

    free=$(
      echo "$stats" |
        grep -E "(Pages free)" |
        sum_macos_vm_stats
    )

    used=$((used_and_cached - cached))
    total=$((used_and_cached + free))

    MEM_USE="$(echo "$used $total" | awk -v format="$ram_percentage_format" '{printf(format, 100*$1/$2)}')"
else
		MEM_USE="$(free -hg | grep Mem: | awk '{ printf $3}' | sed 's/,/\./')"
fi

echo "$MEM_USE"
