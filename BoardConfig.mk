#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Custom TWRP 9.0 build for alps tb8163p3_bsp 
# Custom OFRP 9.0 build for alps tb8163p3_bsp 
#

DEVICE_PATH := device/alps/tb8163p3_bsp

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_VARIANT_RUNTIME := generic
TARGET_PREFER_32_BIT := true
TARGET_USES_64_BIT_BINDER := true

ARCH_ARM_HAVE_NEON := true
TARGET_CPU_SMP := false
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_KERNEL_ARCH_EXCLUDES := -fPIC
TARGET_BOARD_SUFFIX := _32
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := false
TARGET_IS_32_BIT := true

TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_USES_UNCOMPRESSED_KERNEL := false

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := tb8163p3_bsp
TARGET_NO_BOOTLOADER := true

# Build Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display
TARGET_SCREEN_DENSITY := 160

# Kernel     # 0x00C3DA00
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive androidboot.init_fatal_reboot_target=recovery console=ttyS0,921600n1 root=/dev/ram androidboot.hardware=mt8163 firmware_class.path=/vendor/firmware build=06_12_24(gA1A470FC) lcm_id=4000 brightness=8388613 avdd=52 vcom=46 skip_initramfs ro rootwait init=/init root=PARTUUID=e7099731-95a6-45a6-a1e5-1b6aba032cf1 androidboot.verifiedbootstate=orange androidboot.atm=disabled androidboot.meta_log_disable=0 androidboot.dtbo_idx=0 printk.disable_uart=0 bootprof.pl_t=1680 bootprof.lk_t=7245 boot_reason=4 androidboot.serialno=SC5SKNLBEYIRBMR4 androidboot.bootreason=reboot mrdump_ddrsv=yes mrdump_rsvmem=0x56000000,0x400000,0x42000000,0x17f740,0x54000000,0x80000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x15000000
BOARD_KERNEL_TAGS_OFFSET := 0x14000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTBO_SIZE := 40393
BOARD_DTBO_OFFSET := 12834816
BOARD_RECOVERY_DTBO_OFFSET := 12834816
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_BOOTIMG_RECOVERY_DTBO_OFFSET := 0x00C3DA00
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
# BOARD_MKBOOTIMG_ARGS += --recovery_dtbo_offset $(BOARD_RECOVERY_DTBO_OFFSET)
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RECOVERY_NEEDS_T_TOUCH := true
TARGET_KERNEL_CONFIG := tb8163p3_bsp_defconfig
TARGET_KERNEL_SOURCE := kernel/alps/tb8163p3_bsp
CUSTOM_KERNEL_TOUCHPANEL = gt9xxtb_hotknot

# Recovery LZMA Compression
BOARD_RAMDISK_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery boot
BOARD_RAMDISK_COMPRESSED := lzma-9
TARGET_FORCE_PREBUILT_KERNEL := false

# Kernel - prebuilt
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
  KERNEL_PATH := $(DEVICE_PATH)/prebuilt
  DEVICE_PREBUILT_PATH := $(KERNEL_PATH)
  TARGET_PREBUILT_KERNEL := $(DEVICE_PREBUILT_PATH)/kernel
  TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_PREBUILT_PATH)/kernel
  BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PREBUILT_PATH)/dtbo.img
  BOARD_KERNEL_SEPARATED_DTBO :=
endif

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 318767104
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 58426130432
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 314572800
TARGET_COPY_OUT_VENDOR := vendor

# Platform
PRODUCT_KERNEL_ARCH := arm
TARGET_BOARD_PLATFORM := mt8163
TARGET_BOARD_PLATFORM_GPU := mali-t720mp2
TARGET_BOARD_HARDWARE_EGL := mali

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_PREBUILT_RECOVERY_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-09-05

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_OS_VERSION := 9
BOARD_OS_PATCH_LEVEL := 2021-09

# Hackless: Android 9 rollback
PLATFORM_SECURITY_PATCH := 2021-09-05
PLATFORM_VERSION := 9
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

##### TWRP Configuration below #####
BOARD_TWRP_ENABLE := true

# TWRP or OrangeFox Theme Auto Configuration
ifeq ($(RECOVERY_VARIANT),ofrp)
  TW_OEM_BUILD := false
  TW_THEME := portrait_hdpi
  #TW_CUSTOM_THEME := $(DEVICE_PATH)/ofrp/twres
  #TWRP_THEME_LOC := $(TW_CUSTOM_THEME)
  #TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
  TWRP_NEW_THEME := false
  RECOVERY_VARIANT := ofrp
  # VNDK Fix
  BOARD_VNDK_VERSION := current
  BOARD_VNDK_RUNTIME_DISABLE := true
  # Uses Custom ARM Busybox w/ Toybox
  #RECOVERY_BUSYBOX_SYMLINKS := false
  #RECOVERY_BUSYBOX_TOOLS := false
  DEVICE_RESOLUTION := 1080x600                 # The Resolution of your Device
  BOARD_SCREEN_WIDTH := 1080                     # Device resolution width
  BOARD_SCREEN_HEIGHT := 600                     # Device resolution height
  TARGET_SCREEN_HEIGHT := 600                    # The height mdpi
  TARGET_SCREEN_WIDTH := 1080
  # OF Offset X Y
  TARGET_RECOVERY_OVERSCAN_PERCENT := 0
  TW_X_OFFSET := 0
  TW_Y_OFFSET := 0
  #TW_W_OFFSET := 0
  #TW_H_OFFSET := 0
else ifeq ($(RECOVERY_VARIANT),pbrp)
  PB_BUILD_TYPE := UNOFFICIAL
  TW_OEM_BUILD := true
  TW_THEME := portrait_hdpi
  #TW_CUSTOM_THEME := $(DEVICE_PATH)/pbrp/twres
  #TWRP_THEME_LOC := $(TW_CUSTOM_THEME)
  #TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
  #TWRP_NEW_THEME := false
  RECOVERY_VARIANT := pbrp
  # VNDK Fix
  BOARD_VNDK_VERSION := current
  BOARD_VNDK_RUNTIME_DISABLE := true
  # Uses Custom ARM Busybox w/ Toybox
  #RECOVERY_BUSYBOX_SYMLINKS := false
  #RECOVERY_BUSYBOX_TOOLS := false
  #DEVICE_RESOLUTION := 1080x600                 # The Resolution of your Device
  #BOARD_SCREEN_WIDTH := 1080                     # Device resolution width
  #BOARD_SCREEN_HEIGHT := 600                     # Device resolution height
  #TARGET_SCREEN_HEIGHT := 600                    # The height mdpi
  #TARGET_SCREEN_WIDTH := 1080
  # OF Offset X Y
  TARGET_RECOVERY_OVERSCAN_PERCENT := 0
  TW_X_OFFSET := 0
  TW_Y_OFFSET := 0
  #TW_W_OFFSET := 0
  #TW_H_OFFSET := 0
else ifeq ($(RECOVERY_VARIANT),shrp)
  TW_OEM_BUILD := false
  TW_THEME := portrait_hdpi
  #TW_CUSTOM_THEME := $(DEVICE_PATH)/pbrp/twres
  #TWRP_THEME_LOC := $(TW_CUSTOM_THEME)
  #TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
  #TWRP_NEW_THEME := false
  RECOVERY_VARIANT := shrp
  # VNDK Fix
  BOARD_VNDK_VERSION := current
  BOARD_VNDK_RUNTIME_DISABLE := false
  # Uses Custom ARM Busybox w/ Toybox
  #RECOVERY_BUSYBOX_SYMLINKS := false
  #RECOVERY_BUSYBOX_TOOLS := false
  #DEVICE_RESOLUTION := 1080x600                 # The Resolution of your Device
  #BOARD_SCREEN_WIDTH := 1080                     # Device resolution width
  #BOARD_SCREEN_HEIGHT := 600                     # Device resolution height
  #TARGET_SCREEN_HEIGHT := 600                    # The height mdpi
  #TARGET_SCREEN_WIDTH := 1080
  # OF Offset X Y
  TARGET_RECOVERY_OVERSCAN_PERCENT := 0
  TW_X_OFFSET := 0
  TW_Y_OFFSET := 0
  #TW_W_OFFSET := 0
  #TW_H_OFFSET := 0
else
  TW_OEM_BUILD := false
  TW_THEME := portrait_mdpi
  TW_CUSTOM_THEME := $(DEVICE_PATH)/twrp/twres
  TWRP_THEME_LOC := $(TW_CUSTOM_THEME)
  TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
  TWRP_NEW_THEME := true
  RECOVERY_VARIANT := twrp
  # VNDK Fix
  BOARD_VNDK_VERSION := current
  BOARD_VNDK_RUNTIME_DISABLE := true
  # Uses Custom ARM Busybox w/ Toybox
  #RECOVERY_BUSYBOX_SYMLINKS := true
  #RECOVERY_BUSYBOX_TOOLS := true
  #DEVICE_RESOLUTION := 1080x600                 # The Resolution of your Device
  BOARD_SCREEN_WIDTH := 1280                     # Device resolution width
  BOARD_SCREEN_HEIGHT := 720                     # Device resolution height
  TARGET_SCREEN_HEIGHT := 1024                    # The height mdpi
  TARGET_SCREEN_WIDTH := 600         
  # TW Offset X Y
  TARGET_RECOVERY_OVERSCAN_PERCENT := 0
  TW_X_OFFSET := 0
  TW_Y_OFFSET := 0
  #TW_W_OFFSET := 0
  #TW_H_OFFSET := 0
endif

# twrp rotation for special devices
TW_ROTATION := 270
TW_HWROTATION := 270
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80                   # Set custom brightness, low is better
TW_INCLUDE_NTFS_3G := true                    # Include NTFS Filesystem Support
TW_INCLUDE_FUSE_EXFAT := true                 # Include Fuse-ExFAT Filesystem Support
TARGET_RECOVERY_SELINUX := permissive
BOARD_SELINUX_ENFORCING := false
GRAPHIC_MEMORY_PROVIDER := uma
#TW_BOARD_CUSTOM_GRAPHICS := 
USE_OPENGL_RENDERER := true
RECOVERY_GRAPHICS_FORCE_SINGLE_BUFFER := true
TW_DISABLE_DOUBLE_BUFFERING := false
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := false

# Provide for the full range of partition tools to be built for the target . Set it to build all the partition tools (lpmake, lpadd, lpflash, lpunpack, lpdump) and lptools
TW_ENABLE_ALL_PARTITION_TOOLS := true

# This is a build flag that tells the Android build system whether the device uses a generic kernel image or a custom, device-specific kernel image.
BOARD_USES_GENERIC_KERNEL_IMAGE := false
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe

# Need to add back Stock kernel without builtin modules
# Remove prebuilt modules, it's now loaded by kernel modules loader from vendor
TW_LOAD_VENDOR_MODULES := "ilitek.ko sitronix-ts.ko hxchipset-i2c.ko focaltech.ko synaptics_dsx.ko jadard_touch.ko gsl37xx.ko hyn_cst3xx.ko"
#TW_LOAD_VENDOR_MODULES := "*"

# to use TWRP module loader code for vendor_boot module loading.
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# To fix temperature showing 0 degree and battery on 100% all the time
TW_USE_LEGACY_BATTERY_SERVICES := true

# Enable early preparation of /data/media for emulated storage
TW_PREPARE_DATA_MEDIA_EARLY := true

# Enable external storage support
TW_USE_EXTERNAL_STORAGE := true

# This allows for customization of the Android system's behavior, often used to work around device-specific
# issues or to enable advanced features.
TW_OVERRIDE_SYSTEM_PROPS := \
"ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"

BOARD_USES_FULL_RECOVERY_IMAGE := false        # Uncomment this line if you want to remove size restriction
TARGET_USES_AOSP := true

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_TOOLBOX := true

TARGET_RECOVERY_PIXEL_FORMAT := RGB_565
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_LEFT

# Set the Brightness Control File Path below (as per your chip/device)
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness

# Storage
TW_NO_USB_STORAGE := false
TW_INTERNAL_LABEL := data
TW_INTERNAL_PATH := /data/media/0
TW_INTERNAL_MOUNT := /data
TW_INTERNAL_STORAGE_PATH := /data/media/0
TW_INTERNAL_STORAGE_MOUNT_POINT := data
TW_EXTERNAL_LABEL := storage
TW_EXTERNAL_PATH := /storage/udisk*
TW_EXTERNAL_MOUNT := /storage
TW_EXTERNAL_STORAGE_PATH := /storage/udisk*
TW_EXTERNAL_STORAGE_MOUNT_POINT := storage

TW_HAS_MTP := true
TW_INCLUDE_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_DEVICE_VERSION := alps_tb8163p3-bsp
TW_INCLUDE_RESETPROP := true
TW_HAS_DOWNLOAD_MODE := false

# Enable reboot to Fastboot/D HAL
TW_INCLUDE_FASTBOOTD := true

# No Apex
TW_EXCLUDE_APEX := true

# Custom Recovery 
BOARD_USE_DRM := true
TW_POWER_BUTTON := true
TW_HAS_INTERNAL := true
TW_HAS_EXTERNAL := true
TW_HAS_INJECTTWRP := false
TW_HAS_DATA_MEDIA := true
TW_HAS_USB_STORAGE := true
TW_HAS_DUAL_STORAGE := true
TW_HAS_REPACK_TOOLS := true
TW_HAS_BOOT_PARTITION := true
TW_HAS_RECOVERY_PARTITION := true
TW_ALLOW_PARTITION_SDCARD := true
BOARD_SUPPRESS_SECURE_ERASE := true
TWRP_INCLUDE_CRYPTO := false 

TW_CUSTOM_TWRP_FLAGS := $(DEVICE_PATH)/recovery/root/etc/twrp.flags
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab

# GPU MaliT720 support opengl aep
BOARD_OPENGL_AEP := false

# Copy your own init.rc file
TARGET_PROVIDES_INIT_RC := false

# exclude recovery.USB.rc
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Explicitly set the kernel version for depmod
KERNEL_VERSION := 4.9.117+
BOARD_VENDOR_KERNEL_MODULES_DEPMOD_VERSION := $(KERNEL_VERSION)

# Twrp Logging 
TARGET_USES_LOGD := true

# Include LogCat Binary
TWRP_INCLUDE_LOGCAT := true

# Twrp settings 
TW_SUPPORT_INPUT_AOSP := true
TW_DEFAULT_MOUNT_RW := true
TW_ENABLE_ADB_SIDELOAD := true
TW_GRAPHICS_USE_LINELENGTH := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Disable the battery percentage for devices where it doesn't work properly
TW_NO_BATT_PERCENT := false

# Allows you to map a custom keycode for power button, takes in a number, usually three digits
#TW_USE_KEY_CODE_TOUCH_SYNC := 330
TW_CUSTOM_POWER_BUTTON := 116

# Vendor Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# System Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# For people whose screens were mounted the wrong side across
BOARD_HAS_FLIPPED_SCREEN := false

# screen will stay awake
TW_NO_SCREEN_TIMEOUT := true

# don't blank screen (available optional inside recovery settings too)
TW_NO_SCREEN_BLANK := true

# exclude SuperSu e.g. to save some space or for different other reasons (supersu still included by default?)
TW_EXCLUDE_SUPERSU := true

# twrp touch
RECOVERY_TOUCHSCREEN_SWAP_XY := false
RECOVERY_TOUCHSCREEN_FLIP_X := false
RECOVERY_TOUCHSCREEN_FLIP_Y := false

# This tells the build system to ignore neverallow rules when compiling the SELinux policy.
SELINUX_IGNORE_NEVERALLOWS := true

# For Surface Flinger Rotation
SF_PRIMARY_DISPLAY_ORIENTATION := 270

#Screen to Double, Single - YES = Screen to Double - NO = Screen to single
DOUBLE_SCREEN := NO

# Enable UsbDevice to Mtp mode,default is charge mode 
BOARD_USB_ALLOW_DEFAULT_MTP := true

# Force app can see udisk 
BOARD_FORCE_UDISK_VISIBLE := true 
BOARD_IS_SUPPORT_NTFS := true
USE_RECOVERY_INSTALLER := true

# Auto update package from USB
TWRP_EVENT_LOGGING := true
RECOVERY_AUTO_USB_UPDATE := true
BOARD_USB_HOST_SUPPORT := true
BOARD_USB_ACCESSORY_SUPPORT := true
#TWRP_CUSTOM_KEYBOARD := $(DEVICE_PATH)/mtk-kpd.kl
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone4/temp
TW_SUPPORT_INPUT_1_2_HAPTICS := false
TW_DELAY_TOUCH_INIT_MS := 300
TW_FRAMERATE := 30

BOARD_RECOVERY_SWIPE := true
RECOVERY_SDCARD_ON_DATA := false
BOARD_HAS_NO_REAL_SDCARD := false
BOARD_HAS_NO_MISC_PARTITION := true         # Delete if your partition table has /misc

# Twrp Tools
TW_USE_FB2PNG := false
TW_INCLUDE_NANO := false
TW_HAS_EDT_PANEL := true
TW_FLASH_FROM_STORAGE := true

# Metadata
BOARD_USES_METADATA_PARTITION := false
BOARD_ROOT_EXTRA_FOLDERS += metadata

TW_HAS_NO_BOOT_PARTITION := false
TW_HAS_NO_RECOVERY_PARTITION := false

TW_IGNORE_ABS_MT_TRACKING_ID := false
TW_IGNORE_MAJOR_AXIS_0 := false
TW_IGNORE_MT_POSITION_0 := false

# VINTF
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/device_system_manifest.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vendor_manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/device_system_compatibility_matrix.xml

# Define custom paths for battery.
#TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/battery/power_supply/battery

# In BoardConfig.mk, the Android build defines a BOARD_VENDOR_KERNEL_MODULES variable that provides a full list of the kernel modules intended for the vendor image. The modules listed in this variable are copied into the vendor image at /lib/modules/, and, after being mounted in Android, appear in /vendor/lib/modules (in accordance with the above requirements). Example configuration of the vendor kernel modules:
vendor_lkm_dir := vendor/lib/modules
BOARD_VENDOR_KERNEL_MODULES := \
  $(vendor_lkm_dir)/ilitek.ko \
  $(vendor_lkm_dir)/wlan_drv_gen2.ko \
  $(vendor_lkm_dir)/sitronix-ts.ko \
  $(vendor_lkm_dir)/hxchipset-i2c.ko \
  $(vendor_lkm_dir)/focaltech.ko \
  $(vendor_lkm_dir)/wmt_drv.ko \
  $(vendor_lkm_dir)/synaptics_dsx.ko \
  $(vendor_lkm_dir)/jadard_touch.ko \
  $(vendor_lkm_dir)/gsl37xx.ko \
  $(vendor_lkm_dir)/tda7708LX.ko \
  $(vendor_lkm_dir)/betterlife_ts.ko \
  $(vendor_lkm_dir)/qn8035.ko \
  $(vendor_lkm_dir)/si475x.ko \
  $(vendor_lkm_dir)/atmel_mxt_ts.ko \
  $(vendor_lkm_dir)/ak7604.ko \
  $(vendor_lkm_dir)/fy7604.ko \
  $(vendor_lkm_dir)/hyn_cst3xx.ko \
  $(vendor_lkm_dir)/fmradio_drv.ko \
  $(vendor_lkm_dir)/tp9951.ko \
  $(vendor_lkm_dir)/tp9950.ko \
  $(vendor_lkm_dir)/carstatus.ko \
  $(vendor_lkm_dir)/tp2825.ko \
  $(vendor_lkm_dir)/cd3313.ko \
  $(vendor_lkm_dir)/f_iap_zj.ko \
  $(vendor_lkm_dir)/f_iap_lt.ko \
  $(vendor_lkm_dir)/qn8027.ko \
  $(vendor_lkm_dir)/met.ko \
  $(vendor_lkm_dir)/bt_drv.ko \
  $(vendor_lkm_dir)/gps_drv.ko \
  $(vendor_lkm_dir)/wmt_chrdev_wifi.ko
  
# Auto copy files into ramdisk-recovery
#
