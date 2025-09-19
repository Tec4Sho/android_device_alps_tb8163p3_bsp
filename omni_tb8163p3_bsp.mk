#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
# $(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit from tb8163p3_bsp device
$(call inherit-product, device/alps/tb8163p3_bsp/device.mk)

BOARD_VENDOR := tb8163p3_bsp
TARGET_VENDOR := tb8163p3_bsp

PRODUCT_DEVICE := tb8163p3_bsp
PRODUCT_NAME := omni_tb8163p3_bsp
PRODUCT_BRAND := alps
PRODUCT_MODEL := tb8163p3_bsp
PRODUCT_MANUFACTURER := alps

PRODUCT_GMS_CLIENTID_BASE := alps-full_tb8163p3_bsp-{country}

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_tb8163p3_bsp-user 9 PPR1.180610.011 eng.linhr.20250523.004808 release-keys"

BUILD_FINGERPRINT := DIGILAND/DL1023/DL1023:9/PPR1.180610.011/linhr05230047:user/release-keys
