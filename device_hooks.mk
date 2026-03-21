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

# 2. Tell the build system to run your script BEFORE building the recovery image
# We use '::' or a dependency line to avoid breaking the original Ninja rule
# Add $(recovery_ramdisk) to the dependencies list
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(recovery_ramdisk) $(MKBOOTIMG)
	@echo "--- MTK Kernel Patching: Calling Shell Script ---"
	$(hide) bash $(DEVICE_PATH)/patch_kernel.sh \
		"$(MY_MKIMAGE)" \
		"$(MTK_KERNEL_CFG)" \
		"$(recovery_kernel)" \
		"$(PRODUCT_OUT)/kernel"
	@echo "--- Packing Recovery Image ---"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo "--- Recovery Image Built Successfully ---"

