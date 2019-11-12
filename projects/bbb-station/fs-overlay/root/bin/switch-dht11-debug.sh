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

if [ ! -e /sys/kernel/debug/dynamic_debug ]; then
	echo "Cannot switch debugging, debugfs not mounted on /sys/kernel/debug !"
	exit 1
fi

if grep -q "dht11.* =_" /sys/kernel/debug/dynamic_debug/control
then
	m="+"
else
	m="-"
fi

echo "module dht11 ${m}p"	
echo "module dht11 ${m}p" > /sys/kernel/debug/dynamic_debug/control
