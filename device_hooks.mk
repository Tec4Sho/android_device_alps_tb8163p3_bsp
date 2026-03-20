# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := kernel/alps/tb8163p3_bsp/scripts/mkimage
MTK_KERNEL_CFG := device/alps/tb8163p3_bsp/mtk_kernel.cfg

# Intercept the recovery image target
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- MTK Kernel Patching: $(recovery_kernel) ---"
	# Run your specific syntax: tool + zImage + config > output
	chmod +x "$(MY_MKIMAGE)"
	# 2. Run the patch: tool + input + cfg > output
	# Use quotes everywhere to prevent "binary operator" errors from long paths
	"$(MY_MKIMAGE)" "$(recovery_kernel)" "$(MTK_KERNEL_CFG)" > "$(recovery_kernel).mtk"
	# 3. Use standard bash [[ ]] with -s (checks if file exists and is not empty)
	@if [[ -s "$(recovery_kernel).mtk" ]]; then \
		mv -f "$(recovery_kernel).mtk" "$(recovery_kernel)"; \
		echo "--- SUCCESS: MTK Header added to $(recovery_kernel) ---"; \
	else \
		echo "--- ERROR: $(recovery_kernel).mtk is missing or empty! ---"; \
		exit 1; \
	fi
	@echo "--- MTK Kernel Patching Stage Complete ---"

