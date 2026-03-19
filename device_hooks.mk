# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := $(HOST_OUT_EXECUTABLES)/mkimage
MTK_KERNEL_CFG := device/alps/tb8163p3_bsp/mtk_kernel.cfg

# Intercept the recovery image target
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- MTK Kernel Patching: $(recovery_kernel) ---"
	# Run your specific syntax: tool + zImage + config > output
	$(MY_MKIMAGE) $(recovery_kernel) $(MTK_KERNEL_CFG) > $(recovery_kernel).mtk
	# Replace the original kernel with the patched version for mkbootimg
    # Safety check: if the .mtk file is valid, overwrite the original kernel
	@if [ -s $(recovery_kernel).mtk ]; then \
		mv $(recovery_kernel).mtk $(recovery_kernel); \
		echo "--- MTK Header Applied Successfully ---"; \
	else \
		echo "--- ERROR: mkimage failed to create patched kernel ---"; \
		exit 1; \
	fi
	@echo "--- MTK Kernel Patching Complete ---"

