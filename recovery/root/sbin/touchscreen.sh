#!/sbin/sh

mount /apd

if mount | grep -qsF '/apd'; then
    [ -s /apd/virtualkeys ] && paste -sd ":" /apd/virtualkeys > /sbin/virtualkeys
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx
else
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx
fi;
    # Set permissions so the touch driver can read it
    chmod 0444 /sys/board_properties/virtualkeys.TS_GT9xx
    chown root root /sys/board_properties/virtualkeys.TS_GT9xx
    setprop persist.sys.touch.config 1
    echo -e "$(date)\n virtualkeys mounted to virtualkeys.TS_GT9xx" >/cache/recovery_touch_calibration
    echo -e "$(date)\n virtualkeys mounted to virtualkeys.TS_GT9xx" >/data/media/0/recovery_touch_calibration

