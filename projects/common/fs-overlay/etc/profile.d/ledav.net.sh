
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

alias rm='rm -i'

TMOUT=7200
TERM=linux

export TERM

[ `id -u` = "0" ] && col=31 || col=32

export PS1="\[\e[32m\][\[\e[01;${col}m\]\u\[\e[00;32m\]@\h \[\e[01;32m\]\W\[\e[00;32m\]]\$\[\e[m\] "
