
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

SGP30_SOURCE = Sensirion_Gas_Sensors_SGP30_Linux_Driver.zip
SGP30_SITE = https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/13_Sample_Codes_Software/Gas_Sensors
SGP30_LICENSE = GPL-2.0+
SGP30_LICENSE_FILE = LICENSE
SGP30_MODULE_SUBDIRS = sgp30

define SGP30_EXTRACT_CMDS
        $(UNZIP) -d $(@D) $(SGP30_DL_DIR)/$(SGP30_SOURCE)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
