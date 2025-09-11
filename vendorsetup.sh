#	 This file is part of the OrangeFox Recovery Project
# 	 Copyright (C) 2021-2024 The OrangeFox Recovery Project
#	 Copyright (C) 2024 The Android Open Source Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#	SPDX-License-Identifier: Apache-2.0
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	  See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

#FOX_VANILLA_BUILD=1
if [ "$RECOVERY_VARIANT" == "ofrp" ]; then
FDEVICE="tb8163p3_bsp"
fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

 # Other..
   export ALLOW_MISSING_DEPENDENCIES=true
   export FOX_VANILLA_BUILD=1
   export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
   export OF_FORCE_PREBUILT_KERNEL=1
   export FOX_BUILD_DEVICE="tb8163p3_bsp"
   #export OF_PATCH_AVB20=1
   export OF_USE_LOCKSCREEN_BUTTON=1
   export OF_USE_LZMA_COMPRESSION=1
   export FOX_DRASTIC_SIZE_REDUCTION=1
   export TARGET_SCREEN_HEIGHT="600"
   export TARGET_SCREEN_WIDTH="1024"
   export TW_DEFAULT_LANGUAGE="en"
   export LC_ALL="C"
        
 # Fox-specific flags
   export OF_QUICK_BACKUP_LIST="/boot;/data"
   #export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery"
  	#export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/system"
  	#export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/vendor"
  	#export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot"
   export BOARD_BOOTIMAGE_PARTITION_SIZE="16777216"
   export BOARD_RECOVERYIMAGE_PAITION_SIZE="16777216"
   export BOARD_SYSTEMIMAGE_PARTITION_SIZE="2147483648"
  	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
  	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
  	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
   
 # OrangeFox Addons
   export FOX_ENABLE_APP_MANAGER=1

 # Binaries & Tools
   export FOX_USE_BASH_SHELL=1
   export FOX_ASH_IS_BASH=1
   export FOX_USE_NANO_EDITOR=1
   export FOX_USE_TAR_BINARY=1
   export FOX_USE_SED_BINARY=1
   export FOX_USE_XZ_UTILS=1
   export FOX_REPLACE_BUSYBOX_PS=1
   export FOX_REMOVE_BUSYBOX_BINARY=1

 # Recovery 
   export OF_USE_LEGACY_BATTERY_SERVICES=1
   export OF_BIND_MOUNT_SDCARD_ON_FORMAT=1
   export OF_UNMOUNT_SDCARDS_BEFORE_REBOOT=1
   export OF_FORCE_PREBUILT_KERNEL=1
   export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

 # Version & Variant
   export FOX_VERSION="R9.0"
   export FOX_VARIANT="ALPS"
   export FOX_BUILD_TYPE="Stable"

 # A/B partitioning
 ##export FOX_AB_DEVICE=1
 ##export FOX_VIRTUAL_AB_DEVICE=1
 
 # Store settings at /data/recovery instead of internal storage
 ##export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1

 # Security (Disables MTP&ADB during password prompt)
 # no special MIUI stuff
	export OF_NO_MIUI_PATCH_WARNING=1
 
 # Magisk
	export FOX_USE_SPECIFIC_MAGISK_ZIP="~/Magisk/Magisk-v25.2.zip"

 # Debugging
 ##export FOX_RESET_SETTINGS=0
   export FOX_INSTALLER_DEBUG_MODE=1

# run a process after formatting datato work-around MTP issues
   export OF_RUN_POST_FORMAT_PROCESS=1

# fux screen height for tablets
   export OF_SCREEN_H="600"
 
# Maintainer 
   export OF_MAINTAINER="Tec4Sho"

 # Let's see our build VARs ZZZ
   if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
      export | grep "FOX" >> $FOX_BUILD_LOG_FILE
      export | grep "OF_" >> $FOX_BUILD_LOG_FILE
      export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
      export | grep "TW_" >> $FOX_BUILD_LOG_FILE
   fi
fi
fi

 add_lunch_combo omni_tb8163p3_bsp-user
 add_lunch_combo omni_tb8163p3_bsp-userdebug
 add_lunch_combo omni_tb8163p3_bsp-eng
# Reserved
