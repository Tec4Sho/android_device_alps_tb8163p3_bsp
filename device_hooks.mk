# SHELL := /bin/bash
# device/alps/tb8163p3_bsp/device_hooks.mk

# 1. Define your paths (using $(abspath ...) is safer for GitHub Runners)
MY_MKIMAGE := $(abspath $(TARGET_KERNEL_SOURCE)/scripts/mkimage)
MY_RAMDISK := $(PRODUCT_OUT)/mtk_ramdisk.cfg
# 1. Define the ramdisk header config
# Usually NAME = rootfs for ramdisks
$(shell echo "NAME = rootfs" > $(MY_RAMDISK))
$(shell echo "ADDR = 0xffffffff" >> $(MY_RAMDISK))

# 2. Hook the ramdisk creation
$(recovery_ramdisk): .MTK_RAMDISK_PATCH

.PHONY: .MTK_RAMDISK_PATCH
.MTK_RAMDISK_PATCH:
	@echo "--- Adding MTK Header to Ramdisk ---"
	$(hide) $(MY_MKIMAGE) $(recovery_ramdisk) $(MY_RAMDISK) > $(recovery_ramdisk).mtk
	$(hide) mv -f $(recovery_ramdisk).mtk $(recovery_ramdisk)
