# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(TARGET_KERNEL_SOURCE)/scripts/mkimage
MTK_KERNEL_CFG := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(DEVICE_PATH)/mtk_kernel.cfg
# Update K_TARGET to point to the actual binary file
K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/kernel/arch/arm/boot/zImage
# If it's a 64-bit build, it might be:
# K_TARGET := $(PRODUCT_OUT)/obj/KERNEL_OBJ/kernel/arch/arm64/boot/Image.gz-dtb

$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- MTK Kernel Patching: Starting ---"
	chmod +x "$(MY_MKIMAGE)"
	@if [[ -f "$(recovery_kernel)" ]]; then \
		K_SRC="$(recovery_kernel)"; \
	elif [[ -f "$(K_TARGET)" ]]; then \
		K_SRC="$(K_TARGET)"; \
	else \
		echo "--- ERROR: No valid kernel file found! ---"; \
		exit 1; \
	fi; \
	"$(MY_MKIMAGE)" "$$K_SRC" "$(MTK_KERNEL_CFG)" > "$$K_SRC.mtk" || exit 1; \
	mv -f "$$K_SRC.mtk" "$$K_SRC"; \
	echo "--- SUCCESS: MTK Header added to $$K_SRC ---"
