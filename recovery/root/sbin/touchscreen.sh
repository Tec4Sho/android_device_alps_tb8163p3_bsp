#!/sbin/sh

# Read/Write mount default partitions
    mount -o rw,remount /vendor || mount /vendor 2>/dev/null
    mount -o rw,remount /cache || mount -o rw /cache 2>/dev/null
    mount -t ext4 -o rw /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/userdata /data || mount -o rw /data 2>/dev/null
    mount -o rw,remount /apd || mount /apd 2>/dev/null
    mkdir -p /cache/touch 2>/dev/null

if mountpoint -q /apd; then
    [ -s /apd/virtualkeys ] && paste -sd ":" /apd/virtualkeys > /sbin/virtualkeys && export apd=true;
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx && \
    echo -e "$(date)\nTOUCH STATUS: sbin/virtualkeys was bind mounted to sys/board_properties/virtualkeys.TS_GT9xx" > /cache/touch/recovery_touch_calibration 2>/dev/null;
    [ "$apd" == 'true' ] && echo -e "\nVIRTUALKEYS IN USE: sbin/virtualkeys touch calibration was updated from default apd/virtualkeys" >> /cache/touch/recovery_touch_calibration 2>/dev/null
else
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx && \
    echo -e "$(date)\nTOUCH STATUS: sbin/virtualkeys was bind mounted to sys/board_properties/virtualkeys.TS_GT9xx" > /cache/touch/recovery_touch_calibration 2>/dev/null;
fi;
    # Set permissions so the touch driver can read it
    chmod 0444 /sys/board_properties/virtualkeys.TS_GT9xx
    chown root root /sys/board_properties/virtualkeys.TS_GT9xx
    setprop persist.sys.touch.config 1
    while [ ! -d /data/media/0 ]; do 
      sleep 2;
    done;
    cp -f /cache/touch/recovery_touch_calibration /data/media/0/ && \
    chown 1023:1023 /data/media/0/recovery_touch_calibration && \
    chmod 664 /data/media/0/recovery_touch_calibration;
    umount -l /data 2>/dev/null;
