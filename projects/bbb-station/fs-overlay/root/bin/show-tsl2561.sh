#!/bin/sh

# Copyright (C) 2018 David De Grave <david@ledav.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

. /root/bin/devices || exit 1

ir_scale=$(cat $tsl2561/in_intensity_ir_calibscale)
bt_scale=$(cat $tsl2561/in_intensity_both_calibscale)

n=0
while true
do

	n=$((n+1))
	l=$(cat $tsl2561/in_intensity_both_raw 2>/dev/null) || { sleep 1; continue; }
	i=$(cat $tsl2561/in_intensity_ir_raw 2>/dev/null) || { sleep 1; continue; }
	x=$(cat $tsl2561/in_illuminance0_input) || { sleep 1; continue; }

	L=$(awk "BEGIN {printf \"%.4f\", $l / $bt_scale}")
	I=$(awk "BEGIN {printf \"%.4f\", $i / $ir_scale}")
	X=$(awk "BEGIN {printf \"%.4f\", $x / $bt_scale}")

	clear
	echo "$n"
	echo "Light = $l ($L)"
	echo "IR    = $i ($I)"
	echo "Lux   = $x ($X)"
	sleep 5
done
