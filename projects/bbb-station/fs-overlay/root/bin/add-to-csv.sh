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

output='/var/lib/lighttpd/output.csv'

# DHT11 (humidity)
h=$(cat $dht11/in_humidityrelative_input 2>/dev/null) || h=-1
h=$(awk "BEGIN {printf \"%.2f\", $h / 10}")

# DHT11 (temp)
t=$(cat $dht11/in_temp_input 2>/dev/null) || t=-1
t=$(awk "BEGIN {printf \"%.2f\", ($t / 10) * 0.90}")

# VMA407 (luminosity)
l=$(cat $vma407/in_voltage0_raw) || l=-1
l=$(awk "BEGIN {printf \"%.2f\", $l * (100/4095)}")

# TSL2561 (Lux sensor)
xs=$(cat $tsl2561/in_intensity_both_calibscale) || xs=-1
x=$(cat $tsl2561/in_illuminance0_input) || x=-1
x=$(awk "BEGIN {printf \"%.4f\", ($x / $xs)}") # Range from 0.1 to 40.000 Lux

# SGP30 (Gas sensor)
c=$(cat $sgp30/in_concentration_co2_input) || c=-1
c=$(awk "BEGIN {printf \"%.4f\", ($c * 1000)}") # Range from 400 to 60000 ppm
v=$(cat $sgp30/in_concentration_voc_input) || v=-1
v=$(awk "BEGIN {printf \"%.4f\", ($v * 1000000)}") # Range from 0 to 60000 ppb

# Date/Time
dt=$(date +%Y%m%d-%H%M%S)

out="$dt,$h,$t,$l,$x,$c,$v"

echo $out
echo $out >> $output
chgrp www-data $output && chmod 664 $output
