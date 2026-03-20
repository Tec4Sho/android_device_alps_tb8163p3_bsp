# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := $(TARGET_KERNEL_SOURCE)/scripts/mkimage
MTK_KERNEL_CFG := $(DEVICE_PATH)/mtk_kernel.cfg
DYN_OUT := $(get_build_var OUT_DIR)
K_SRC := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/out/target/product/tb8163p3_bsp/obj/KERNEL_OBJ/kernel

# Intercept the recovery image target
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- MTK Kernel Patching: $(K_SRC) ---"
	# Run your specific syntax: tool + zImage + config > output
	chmod +x "$(MY_MKIMAGE)"
	# 2. Run the patch: tool + input + cfg > output
	# Use quotes everywhere to prevent "binary operator" errors from long paths
    @if [[ -s "$(recovery_kernel)" ]]; then \
	    "$(MY_MKIMAGE)" "$(recovery_kernel)" "$(MTK_KERNEL_CFG)" > "$(recovery_kernel).mtk" \
        echo "--- MTK Kernel Patching Stage Complete! $(recovery_kernel) ---"; \
    else \
        "$(MY_MKIMAGE)" "$(K_SRC)" "$(MTK_KERNEL_CFG)" > "$(K_SRC).mtk" \
        echo "--- MTK Kernel Patching Stage Complete! $(K_SRC) ---"; \
    fi;
	# 3. Use standard bash [[ ]] with -s (checks if file exists and is not empty)
	@if [[ -s "$(recovery_kernel).mtk" ]]; then \
		mv -f "$(recovery_kernel).mtk" "$(recovery_kernel)"; \
		echo "--- SUCCESS: MTK Header added to $(recovery_kernel) ---"; \
        exit 0; \
	else \
		echo "--- ERROR: $(K_SRC).mtk is missing or empty! ---"; \
	fi;
    @if [[ -s "$(K_SRC).mtk" ]]; then \
		mv -f "$(K_SRC).mtk" "$(K_SRC)"; \
		echo "--- SUCCESS: MTK Header added to $(K_SRC) ---"; \
        echo "--- MTK Kernel Patching Stage Complete! $(DYN_OUT) ---"; \
	else \
		echo "--- ERROR: $(K_SRC).mtk is missing or empty! ---"; \
	fi;
