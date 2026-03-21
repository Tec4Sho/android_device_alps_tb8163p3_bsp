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

# 2. Hook the KERNEL binary directly.
# This ensures the patch runs AFTER the kernel is built but BEFORE any .img is packed.
$(K_TARGET): .K_PATCH_HOOK

.PHONY: .K_PATCH_HOOK
.K_PATCH_HOOK:
	@echo "--- MTK Kernel Patching Hook ---"
	$(hide) bash "$(PATCH_SCRIPT)" \
		"$(MY_MKIMAGE)" \
		"$(MTK_KERNEL_CFG)" \
		"$(K_TARGET)" \
		"$(K_TARGET)"
