#!/bin/bash
#
#    Copyright © 2016 Zetok Zalbavar <zetok@openmailbox.org>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


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
