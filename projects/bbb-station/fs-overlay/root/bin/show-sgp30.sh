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

# in_concentration_co2_input
# in_concentration_ethanol_raw
# in_concentration_h2_raw
# in_concentration_voc_input
# set_absolute_humidity

n=0
while true
do
	n=$((n+1))
	
	c=$(cat $sgp30/in_concentration_co2_input)
	v=$(cat $sgp30/in_concentration_voc_input)
	e=$(cat $sgp30/in_concentration_ethanol_raw)
	h=$(cat $sgp30/in_concentration_h2_raw)

	C=$(awk "BEGIN {printf \"%.4f\", ($c * 1000)}")
	V=$(awk "BEGIN {printf \"%.4f\", ($v * 1000000)}")

	clear
	echo "$n"
	echo "H2      = $h"
	echo "Ethanol = $e"
	echo "CO2-eq  = $c ($C ppm/1000)"
	echo "TVOC    = $v ($V ppm)"
	sleep 1
done
