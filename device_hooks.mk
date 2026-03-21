SHELL := /bin/bash
# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(TARGET_KERNEL_SOURCE)/scripts/mkimage
MTK_KERNEL_CFG := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(DEVICE_PATH)/mtk_kernel.cfg
# Update K_TARGET to point to the actual binary file
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/zImage
# If it's a 64-bit build, it might be:
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb
K_TARGET := $(PRODUCT_OUT)/kernel

# Patch the file that actually gets packed into the image
# Tell the build system that before the recovery image is made, 
# the kernel file MUST be patched.
$(recovery_kernel): patch_mtk_kernel

.PHONY: patch_mtk_kernel
patch_mtk_kernel:
	@echo "--- MTK Kernel Patching: Injecting Header ---"
	$(hide) bash $(DEVICE_PATH)/patch_kernel.sh \
		"$(MY_MKIMAGE)" \
		"$(MTK_KERNEL_CFG)" \
		"$(recovery_kernel)" \
		"$(K_TARGET)"
