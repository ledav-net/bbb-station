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
	h=$(cat $dht11/in_humidityrelative_input 2>/dev/null) || { sleep 1; continue; }
	t=$(cat $dht11/in_temp_input 2>/dev/null) || { sleep 1; continue; }

	clear
	echo "$n"
	echo "humidity    = $((h/10)).$((h%10))"
	echo "temperature = $((t/10)).$((t%10))"
	sleep 20
done
