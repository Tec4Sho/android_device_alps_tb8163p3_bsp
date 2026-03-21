SHELL := /bin/bash
# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
# MY_MKIMAGE := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(TARGET_KERNEL_SOURCE)/scripts/mkimage
# MTK_KERNEL_CFG := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(DEVICE_PATH)/mtk_kernel.cfg
# Update K_TARGET to point to the actual binary file
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/zImage
# If it's a 64-bit build, it might be:
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb

# 1. Define your paths (using $(abspath ...) is safer for GitHub Runners)
MY_MKIMAGE := $(abspath $(TARGET_KERNEL_SOURCE)/scripts/mkimage)
MTK_KERNEL_CFG := $(abspath $(DEVICE_PATH)/mtk_kernel.cfg)
PATCH_SCRIPT := $(abspath $(DEVICE_PATH)/patch_kernel.sh)
K_TARGET := $(PRODUCT_OUT)/kernel

# 1. Point to the RAW zImage inside the KERNEL_OBJ folder
RAW_K := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/arch/arm/boot/zImage

# 2. Tell the build: "Every time you finish building the kernel, run this"
# No quotes on the variables here
$(RAW_K): .MTK_CI_PATCH

.PHONY: .MTK_CI_PATCH
.MTK_CI_PATCH:
	@echo "--- [MTK] Patching RAW Kernel in Intermediates ---"
	$(hide) chmod +x $(MY_MKIMAGE)
	$(hide) $(MY_MKIMAGE) $(RAW_K) $(MTK_KERNEL_CFG) > $(RAW_K).mtk
	$(hide) mv -f $(RAW_K).mtk $(RAW_K)
	@echo "--- [MTK] Kernel Patched at Source ---"
