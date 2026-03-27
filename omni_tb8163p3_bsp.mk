#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
# $(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base.mk)

# Add this line if your device is 64-bit
# Otherwise, If you have 32-bit device, add the below line instead of above line
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Another common config inclusion
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit some common Omni stuff.
$(call inherit-product-if-exists, vendor/omni/config/common.mk)

# Inherit from tb8163p3_bsp device tree
$(call inherit-product, device/alps/tb8163p3_bsp/device.mk)

# Inherit from tb8163p3_bsp kernel tree
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),false)
# $(call inherit-product, kernel/alps/tb8163p3_bsp/AndroidKernel.mk)
endif

ifeq ($(RECOVERY_VARIANT),pbrp)
#  $(call inherit-product-if-exists, vendor/pb/config/common.mk)
endif

LOCAL_PATH := device/alps/tb8163p3
# Replace $$DEVICE$$ with your Device Name's Value.
# Replace $$BRAND$$ with your Brand's / Manufacturer's Value.
PRODUCT_COPY_FILES += device/alps/tb8163p3/prebuilt/zImage:kernel
PRODUCT_COPY_FILES += device/alps/tb8163p3/prebuilt/dtbo.img:dtbo

BOARD_VENDOR := tb8163p3_bsp
TARGET_VENDOR := tb8163p3_bsp

PRODUCT_DEVICE := tb8163p3_bsp
PRODUCT_NAME := omni_tb8163p3_bsp
PRODUCT_BRAND := alps
PRODUCT_MODEL := tb8163p3_bsp
PRODUCT_MANUFACTURER := alps

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_tb8163p3_bsp-user 9 PPR1.180610.011 eng.linhr.20250523.004808 release-keys" \
    BUILD_UTC_DATE=0 \
    BUILD_FINGERPRINT="DIGILAND/DL1023/DL1023:9/PPR1.180610.011/linhr05230047:user/release-keys"
