SHELL := /bin/bash
# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(TARGET_KERNEL_SOURCE)/scripts/mkimage
MTK_KERNEL_CFG := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(DEVICE_PATH)/mtk_kernel.cfg
# Update K_TARGET to point to the actual binary file
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm/boot/zImage
# If it's a 64-bit build, it might be:
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb
# Patch the file that actually gets packed into the image
K_TARGET := $(PRODUCT_OUT)/kernel

# Define the path to your new script
PATCH_SCRIPT := $(DEVICE_PATH)/patch_kernel.sh

$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- Running MTK Patch Script ---"
	$(hide) bash $(PATCH_SCRIPT) "$(MY_MKIMAGE)" "$(MTK_KERNEL_CFG)" "$(recovery_kernel)" "$(K_TARGET)"
