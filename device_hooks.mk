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

# This variable points to the final kernel binary in Android 9
KERNEL_BIN := $(PRODUCT_OUT)/kernel

# Tell Ninja: "Before you consider the kernel installed, run this patch."
$(KERNEL_BIN): .PATCH_MTK_HEADER

.PHONY: .PATCH_MTK_HEADER
.PATCH_MTK_HEADER: $(recovery_kernel)
	@echo "--- Intercepting Kernel: $(notdir $(KERNEL_BIN)) ---"
	$(hide) chmod +x $(MY_MKIMAGE)
	# Patch the source zImage BEFORE it's finalized
	$(hide) $(MY_MKIMAGE) $(recovery_kernel) $(MTK_KERNEL_CFG) > $(KERNEL_BIN).tmp
	$(hide) mv -f $(KERNEL_BIN).tmp $(KERNEL_BIN)
	@hexdump -C -n 16 $(KERNEL_BIN)
