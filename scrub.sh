#!/bin/bash

# script to scrub from znc logs ~IPs when joining/leaving/parting
#
# also scrub control characters
#
# depends on:
#   * sed
#
# usage:
#   ./$script_name $input_filename > $output_filename

set -eu -o pipefail

sed -r -e '/^\[([0-9]{2}:){2}[0-9]{2}\] \*{3} (Joins|Quits|Parts): .* \(.*@.*\)$/s/@[^ ]*\)/@ )/' \
    -e 's/[[:cntrl:]]([[:digit:]]{2})?//g' \
    ${@}
