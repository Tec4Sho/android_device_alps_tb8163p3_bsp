#!/sbin/sh

mount /apd >/dev/null 2>&1
mount /cache >/dev/null 2>&1
mkdir -p /cache/recovery >/dev/null 2>&1

if mount | grep -qsF '/apd'; then
    [ -s /apd/virtualkeys ] && paste -sd ":" /apd/virtualkeys > /sbin/virtualkeys
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx && echo -e "$(date)\nTOUCH STATUS: apd/virtualkeys was bind mounted to sys/board_properties/virtualkeys.TS_GT9xx" >/cache/recovery/recovery_touch_calibration >/dev/null 2>&1
else
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx && echo -e "$(date)\nTOUCH STATUS: sbin/virtualkeys was bind mounted to sys/board_properties/virtualkeys.TS_GT9xx" >/cache/recovery/recovery_touch_calibration >/dev/null 2>&1
fi;
    # Set permissions so the touch driver can read it
    chmod 0444 /sys/board_properties/virtualkeys.TS_GT9xx
    chown root root /sys/board_properties/virtualkeys.TS_GT9xx
    setprop persist.sys.touch.config 1
    
