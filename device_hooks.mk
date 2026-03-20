# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := $(TARGET_KERNEL_SOURCE)/scripts/mkimage
MTK_KERNEL_CFG := $(DEVICE_PATH)/mtk_kernel.cfg
DYN_OUT := $(get_build_var OUT_DIR)
K_TARGET := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/out/target/product/tb8163p3_bsp/obj/KERNEL_OBJ/kernel

# Intercept the recovery image target
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- MTK Kernel Patching: $(K_SRC) ---"
	chmod +x "$(MY_MKIMAGE)"
	@if [ -s "$(recovery_kernel)" ]; then \
	    "$(MY_MKIMAGE)" "$(recovery_kernel)" "$(MTK_KERNEL_CFG)" > "$(recovery_kernel).mtk"; \
	    echo "--- MTK Kernel Patching Stage Complete! $(recovery_kernel) ---"; \
	    if [ -s "$(recovery_kernel).mtk" ]; then \
	        mv -f "$(recovery_kernel).mtk" "$(recovery_kernel)"; \
	        echo "--- SUCCESS: MTK Header added to $(recovery_kernel) ---"; \
	    else \
	        echo "--- ERROR: $(recovery_kernel).mtk is missing or empty! ---"; \
	        exit 1; \
	    fi; \
	else \
	    "$(MY_MKIMAGE)" "$(K_TARGET)" "$(MTK_KERNEL_CFG)" > "$(K_TARGET).mtk"; \
	    echo "--- MTK Kernel Patching Stage Complete! $(K_TARGET) ---"; \
	    if [ -s "$(K_TARGET).mtk" ]; then \
	        mv -f "$(K_TARGET).mtk" "$(K_TARGET)"; \
	        echo "--- SUCCESS: MTK Header added to $(K_TARGET) ---"; \
	    else \
	        echo "--- ERROR: $(K_TARGET).mtk is missing or empty! ---"; \
	        exit 1; \
	    fi; \
	fi
