#!/sbin/sh

# Read/Write mount default partitions
    mkdir -p /system_root/system/media 2>/dev/null;
    mkdir -p /cache/touch 2>/dev/null;
    mkdir -p /data 2>/dev/null;
    mount -o rw,remount /system_root || mount /system_root 2>/dev/null;
    mount -o rw,remount /vendor || mount /vendor 2>/dev/null;
    mount -o rw,remount /cache || mount -o rw /cache 2>/dev/null;
    mount -t ext4 /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/userdata /data || mount /data 2>/dev/null;
    mount -o rw,remount /apd || mount /apd 2>/dev/null;
    mount -o rw,remount /data || true
    
if mountpoint -q /apd; then
    [ -s /apd/virtualkeys ] && paste -sd ":" /apd/virtualkeys > /sbin/virtualkeys && export apd=true;
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx && \
    echo -e "$(date)\nTOUCH STATUS: sbin/virtualkeys was bind mounted to sys/board_properties/virtualkeys.TS_GT9xx" > /cache/touch/recovery_touch_calibration 2>/dev/null;
    [ "$apd" == 'true' ] && echo -e "\nVIRTUALKEYS IN USE: sbin/virtualkeys touch calibration was updated from default apd/virtualkeys" >> /cache/touch/recovery_touch_calibration 2>/dev/null;
else
    mount --bind /sbin/virtualkeys /sys/board_properties/virtualkeys.TS_GT9xx && \
    echo -e "$(date)\nTOUCH STATUS: sbin/virtualkeys was bind mounted to sys/board_properties/virtualkeys.TS_GT9xx" > /cache/touch/recovery_touch_calibration 2>/dev/null;
fi;

    getevent -p >> /cache/touch/recovery_touch_calibration 2>/dev/null;
    echo 'Touch Calibration:' >> /cache/touch/recovery_touch_calibration 2>/dev/null;
    cat /sbin/virtualkeys >> /cache/touch/recovery_touch_calibration 2>/dev/null;
    # Set permissions so the touch driver can read it
    chmod 0664 /cache/touch/recovery_touch_calibration 2>/dev/null;
    chmod 0444 /sys/board_properties/virtualkeys.TS_GT9xx 2>/dev/null;
    chown root root /cache/touch/recovery_touch_calibration 2>/dev/null;
    chown root root /sys/board_properties/virtualkeys.TS_GT9xx 2>/dev/null;
    setprop persist.sys.touch.config 1
    ( 
    while [ ! -d /data/media/0 ]; do 
      sleep 1
    done;
    if [ -e /data/media/0/TWRP/bootanimation.zip ] && [ -d /system_root/system/media/ ]; then
      cp -vf /data/media/0/TWRP/bootanimation.zip /system_root/system/media/ && \
      chmod -v 0775 /system_root/system/media/bootanimation.zip && \
      chown 0:0 /system_root/system/media/bootanimation.zip && \
      chcon u:object_r:system_file:s0 /system_root/system/media/bootanimation.zip;
      umount -l /system_root 2>/dev/null;
    fi;
    cp -f /cache/touch/recovery_touch_calibration /data/media/0/ && \
    chown 1023:1023 /data/media/0/recovery_touch_calibration && \
    chmod 664 /data/media/0/recovery_touch_calibration;
    umount -l /data 2>/dev/null;
    ) &
