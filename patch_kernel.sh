#!/bin/bash
set -e

MKIMAGE="$1"
KERNEL_CFG="$2"
RECOVERY_K="$3"
TARGET_K="$4"

# 1. Determine Source (Priority: Recovery Kernel -> Target Kernel)
if [[ -f "$RECOVERY_K" ]]; then
    K_SRC="$RECOVERY_K"
elif [[ -f "$TARGET_K" ]]; then
    K_SRC="$TARGET_K"
else
    echo "--- ERROR: No kernel file found to patch! ---"
    exit 1
fi

echo "--- MTK Kernel Patching: $K_SRC ---"

# 2. Show header BEFORE patching
echo "Before Patch:"
hexdump -C -n 16 "$K_SRC" 2>&1 || echo "hexdump error: $?"

# 3. Apply the MTK Header
chmod +x "$MKIMAGE"
"$MKIMAGE" "$K_SRC" "$KERNEL_CFG" > "$K_SRC.mtk"

# 4. Verify and Replace
if [[ -s "$K_SRC.mtk" ]]; then
    mv -f "$K_SRC.mtk" "$K_SRC"
    echo "--- SUCCESS: MTK Header added to $K_SRC ---"
    
    # 5. Show header AFTER patching (Should see MTK-specific magic bytes)
    echo "After Patch:"
    hexdump -C -n 16 "$K_SRC" 2>&1 || echo "hexdump error: $?"
else
    echo "--- ERROR: Failed to generate .mtk file ---"
    exit 1
fi
