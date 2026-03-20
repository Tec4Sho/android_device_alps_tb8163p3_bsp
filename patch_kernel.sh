#!/bin/bash
# Exit on any error
set -e

MKIMAGE=$1
KERNEL_CFG=$2
RECOVERY_K=$3
TARGET_K=$4

echo "--- MTK Kernel Patching Start ---"
chmod +x "$MKIMAGE"

# Determine which kernel file to use
if [[ -e "$RECOVERY_K" ]]; then
    K_SRC="$RECOVERY_K"
elif [[ -e "$TARGET_K" ]]; then
    K_SRC="$TARGET_K"
else
    echo "--- ERROR: No valid kernel file found at $TARGET_K ---"
    exit 1
fi

# Run the patch
"$MKIMAGE" "$K_SRC" "$KERNEL_CFG" > "$K_SRC.mtk"

# Verify and move
if [[ -s "$K_SRC.mtk" ]]; then
    mv -f "$K_SRC.mtk" "$K_SRC"
    echo "--- SUCCESS: MTK Header added to $K_SRC ---"
else
    echo "--- ERROR: Failed to generate .mtk file ---"
    exit 1
fi
