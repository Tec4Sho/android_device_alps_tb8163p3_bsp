# device/alps/tb8163p3_bsp/device_hooks.mk

# Define the path to your config and mkimage tool
MY_MKIMAGE := $(TARGET_KERNEL_SOURCE)/scripts/mkimage
MTK_KERNEL_CFG := $(DEVICE_PATH)/mtk_kernel.cfg
DYN_OUT := $(get_build_var OUT_DIR)
K_SOURCE := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/$(TARGET_KERNEL_SOURCE)/kernel
K_TARGET := /home/runner/work/android_device_alps_tb8163p3_bsp/android_device_alps_tb8163p3_bsp/workspace/out/target/product/tb8163p3_bsp/obj/KERNEL_OBJ/kernel

# Intercept the recovery image target
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel) $(MTK_KERNEL_CFG)
	@echo "--- MTK Kernel Patching: $(DYN_OUT)/target/product/tb8163p3_bsp/obj/KERNEL_OBJ/kernel ---"
	chmod +x "$(MY_MKIMAGE)"
	@if [ -s "$(K_SOURCE)" ]; then \
	    "$(MY_MKIMAGE)" "$(K_SOURCE)" "$(MTK_KERNEL_CFG)" > "$(K_SOURCE).mtk"; \
	    echo "--- MTK Kernel Patching Stage Complete! $(K_SOURCE) ---"; \
	    if [ -s "$(K_SOURCE).mtk" ]; then \
	        mv -f "$(K_SOURCE).mtk" "$(K_SOURCE)"; \
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
