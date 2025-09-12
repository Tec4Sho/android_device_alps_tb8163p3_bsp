#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Path to build files
LOCAL_PATH := device/alps/tb8163p3_bsp

DEVICE_PATH := $(LOCAL_PATH)

# Enable reboot to Fastboot/D HAL
TW_INCLUDE_FASTBOOTD := true

# This device does support fastboot boot, do *NOT* remove!
TW_NO_FASTBOOT_BOOT := false

# This device has dedicated recovery partition 
TW_HAS_RECOVERY_PARTITION := true

PRODUCT_SHIPPING_API_LEVEL := 28

GIT_DISCOVERY_ACROSS_FILESYSTEM := 1

BOARD_SCREEN_HEIGHT := 600

BOARD_SCREEN_WIDTH := 1024

TARGET_SCREEN_HEIGHT := 600

TARGET_SCREEN_WIDTH := 1024

# Add device code name 
TARGET_BOOTLOADER_BOARD_NAME := tb8163p3_bsp

# ​Add device code name​​
TARGET_OTA_ASSERT_DEVICE := tb8163p3_bsp

TARGET_COPY_OUT_VENDOR := vendor

TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/testkey
