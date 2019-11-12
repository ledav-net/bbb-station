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

    if ( ! isset($_GET['since']) || $_GET['since'] == '' ) {
        $dtlimit = date('Ymd-His', strtotime('-1 days'));
    }else{
        $dtlimit = $_GET['since'];
    }
    $f = fopen('/var/lib/lighttpd/output.csv', 'r');
    while ( $b = fgets($f) ) {
        $t = preg_split('/,/', $b);
        if ( strcmp($t[0], $dtlimit) > 0 ) echo $b;
    }
    @fclose($f);
?>
