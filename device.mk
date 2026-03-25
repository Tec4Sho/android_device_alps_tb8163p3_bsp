#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Path to build files
LOCAL_PATH := device/alps/tb8163p3_bsp

DEVICE_PATH := $(LOCAL_PATH)

# API/SDK Version
PRODUCT_SHIPPING_API_LEVEL := 28

BOARD_SHIPPING_API_LEVEL := $(PRODUCT_SHIPPING_API_LEVEL)

BOARD_API_LEVEL := $(PRODUCT_SHIPPING_API_LEVEL)

SHIPPING_API_LEVEL := $(PRODUCT_SHIPPING_API_LEVEL)

PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

PRODUCT_NEXT_RELEASE_HIDE_FLAGGED_API := true

# Product characteristics 
PRODUCT_CHARACTERISTICS := tablet 

# Enable reboot to Fastboot/D HAL
TW_INCLUDE_FASTBOOTD := true

# This device does support fastboot boot, do *NOT* remove!
TW_NO_FASTBOOT_BOOT := false

# This device has dedicated recovery partition 
TW_HAS_RECOVERY_PARTITION := true

GIT_DISCOVERY_ACROSS_FILESYSTEM := 1

# Add device code name 
TARGET_BOOTLOADER_BOARD_NAME := tb8163p3_bsp

# ​Add device code name​​
TARGET_OTA_ASSERT_DEVICE := tb8163p3_bsp

TARGET_COPY_OUT_VENDOR := vendor

TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0

# Fastbootd control HAL
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.1-service-clearkey \
    android.hardware.drm@1.1-service.widevine \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0 \
    android.hardware.drm@1.1 \
    libdrmmtkplugin \
    libdrmframework_jni \
    libdrmframework \
    libdrmmtkutil \
    libdrmmtkwhitelist \
    libfw_drmutils \
    libmediadrm \
    libmediadrmmetrics \
    libdrmclearkeyplugin \
    libmockdrmcrytoplugin \
    libwvdrmengine

# Graphics 
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# Keymaster 
PRODUCT_PACKAGES += \
   android.hardware.keymaster@3.0-impl

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/testkey
