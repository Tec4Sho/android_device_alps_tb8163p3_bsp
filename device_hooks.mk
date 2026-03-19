# device/alps/tb8163p3_bsp/device_hooks.mk

# This rule tells the build system to run your script 
# whenever the recovery image is being prepared.
$(INSTALLED_RECOVERYIMAGE_TARGET): .KATI_IMPLICIT_OUTPUTS := $(recovery_kernel).patched

# We add a custom command to the existing recovery image recipe
# $(recovery_kernel) usually points to $(PRODUCT_OUT)/kernel
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_kernel)
	@echo "--- Patching Kernel for Recovery with mkimage ---"
	# Example mkimage command (adjust arguments for your specific header needs)
	mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008000 -n "Kernel" -d $(recovery_kernel) $(recovery_kernel).tmp
	# Overwrite the original kernel with the patched version so mkbootimg picks it up
	mv $(recovery_kernel).tmp $(recovery_kernel)
