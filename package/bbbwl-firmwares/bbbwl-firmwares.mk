
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

BBBWL_FIRMWARES_VERSION = bf21f74dbe711bc8c9ed9a3e7dc74cbc578ece57
BBBWL_FIRMWARES_SITE = https://github.com/beagleboard/beaglebone-black-wireless.git
BBBWL_FIRMWARES_SITE_METHOD = git
BBBWL_FIRMWARES_LICENSE = CC-BY-4.0
BBBWL_FIRMWARES_LICENSE_FILES = LICENSE

define BBBWL_FIRMWARES_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 644 $(@D)/firmware/wl18xx-conf.bin \
		$(TARGET_DIR)/usr/lib/firmware/ti-connectivity/wl18xx-conf.bin
endef

$(eval $(generic-package))
