#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
# shellcheck disable=SC1091
source "${script_dir}/helpers.sh"

# Tests that the default options are set correctly
tmux source "${script_dir}/../everforest_options_tmux.conf"
tmux source "${script_dir}/../everforest_tmux.conf"

print_option @everforest_status_battery
