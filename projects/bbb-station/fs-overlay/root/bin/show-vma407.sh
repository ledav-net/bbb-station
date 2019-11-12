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

n=0
while true
do
	n=$((n+1))
	v=$(cat $vma407/in_voltage0_raw) || { sleep 1; continue; }

	clear
	echo "$n"
	echo "Volts = $v"
	echo "%     = $(awk "BEGIN {printf \"%.2f\", $v * (100/4095)}")"
	sleep 2
done
