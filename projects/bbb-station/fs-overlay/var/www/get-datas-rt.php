<?
/*
 * Copyright (C) 2018 David De Grave <david@ledav.net>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Pragma: no-cache');

    do {
        # DHT11 (humidity/temp)
        $dht11='/sensors/dht11';
        $H = round((float)file_get_contents("$dht11/in_humidityrelative_input") / 10, 2);
        $T = round(((float)file_get_contents("$dht11/in_temp_input") / 10)*0.90, 2);
        if ( $H == 0 || $T == 0 ) sleep(1);
        else                      break;
    } while (1);

    # VMA407 (luminosity)
    $vma407 = '/sensors/vma407';
    $L = round((float)file_get_contents("$vma407/in_voltage0_raw") * (100/4095), 2);

    # TSL2561 (Lux Sensor)
    $tsl2561 = '/sensors/tsl2561';
    $XS = (float)file_get_contents("$tsl2561/in_intensity_both_calibscale");
    $X = round((float)file_get_contents("$tsl2561/in_illuminance0_input") / $XS, 4);

    # SGP30 (Gas Sensor)
    $sgp30 = '/sensors/sgp30';
    $C = round((float)file_get_contents("$sgp30/in_concentration_co2_input") *    1000, 6);
    $V = round((float)file_get_contents("$sgp30/in_concentration_voc_input") * 1000000, 6);
    // In PHP: float = double

    # Date/Time
    $DT = date("Ymd-His");

    printf("%s,%.2f,%.2f,%.2f,%.4f,%.4f,%.4f\n", $DT, $H, $T, $L, $X, $C, $V);
?>
