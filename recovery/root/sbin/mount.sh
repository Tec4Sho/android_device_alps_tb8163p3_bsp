#!/sbin/sh
# Touchscreen drivers (backup only) modules loader!!! 
# Drivers are auto loaded by patched kernel for this.
# Errors logging on recovery startup saved in cache/logs


log='/cache/logs/custom-recovery.log';
file1='/data/media/0/TWRP/log';
file2='/data/media/0/Fox/log';
file3='/data/media/0/TWRP/tw-recovery.log';
file4='/data/media/0/Fox/of-recovery.log';

resetprop ro.sf.hwrotation 270 >/dev/null 2>&1;
resetprop ro.build.characteristics tablet >/dev/null 2>&1;
resetprop ro.mtk_is_tablet 1 >/dev/null 2>&1;
resetprop windowsmgr.support_rotation_270 true >/dev/null 2>&1;
setprop modules.loaded 1 
setprop vendor.all.modules.ready 1
	 
	[[ ! -d $(dirname $log) ]] && mkdir -p /cache/logs;

	if [ -f $log ]; then
		mv -f $log ${log}.old;
	fi;
	
	if [ -f $file1 ] || [ -f $file2 ]; then
		resetprop persist.log.tag V
		resetprop persist.logd.logpersistd true
		resetprop ro.logd.kernel true
		setprop logcat.live true
		resetprop ro.boot.meta_log_disable 0
		echo '#' >> $log;
		echo 'PROC MODULES ?' >> $log;
		echo '#' >> $log;
		cat /proc/modules >> $log 2>&1;
		echo '#' >> $log;
		echo 'LSMOD MODULES ?' >> $log;
		echo '#' >> $log;
		lsmod >> $log 2>&1;
		echo '#' >> $log;
		echo 'LOGCAT FULLY LOGGED ?' >> $log;
		echo '#' >> $log;
		logcat -d -b 'all' -f $log 2>&1 || echo 'logcat not running' >> $log;
		echo '#' >> $log;
		echo 'DMESG RECOVERY LOGGED ?' >> $log;
		echo '#' >> $log;
		dmesg -c >> $log;
		echo '#' >> $log;
		echo 'DMESG RECOVERY NEW 50-SEC LOGGED ?' >> $log;
		echo '#' >> $log;
	fi;

    if [ -f $file1 ]; then
	    cp -f ${log} ${file3} 2>/dev/null;
    elif [ -f $file2 ]; then
	    cp -f ${log} ${file4} 2>/dev/null;
	fi;
  
	## Get your device's block path where "system", "recovery", etc. lives.
	# That can be "/dev/block/bootdevice/by-name" or something like that.
	mkdir -p /dev/block/platform/mtk-msdc.0/by-name/
	
	touch /dev/block/platform/mtk-msdc.0/by-name/apd
	touch /dev/block/platform/mtk-msdc.0/by-name/boot
	touch /dev/block/platform/mtk-msdc.0/by-name/cache
	touch /dev/block/platform/mtk-msdc.0/by-name/dkb
	touch /dev/block/platform/mtk-msdc.0/by-name/dtbo
	touch /dev/block/platform/mtk-msdc.0/by-name/expdb
	touch /dev/block/platform/mtk-msdc.0/by-name/flashinfo
	touch /dev/block/platform/mtk-msdc.0/by-name/frp
	touch /dev/block/platform/mtk-msdc.0/by-name/kb
	touch /dev/block/platform/mtk-msdc.0/by-name/lk
	touch /dev/block/platform/mtk-msdc.0/by-name/lk2
	touch /dev/block/platform/mtk-msdc.0/by-name/logo
	touch /dev/block/platform/mtk-msdc.0/by-name/metadata
	touch /dev/block/platform/mtk-msdc.0/by-name/nvram
	touch /dev/block/platform/mtk-msdc.0/by-name/nvrom
	touch /dev/block/platform/mtk-msdc.0/by-name/para
	touch /dev/block/platform/mtk-msdc.0/by-name/persist
	touch /dev/block/platform/mtk-msdc.0/by-name/proinfo
	touch /dev/block/platform/mtk-msdc.0/by-name/protect1
	touch /dev/block/platform/mtk-msdc.0/by-name/protect2
	touch /dev/block/platform/mtk-msdc.0/by-name/recovery
	touch /dev/block/platform/mtk-msdc.0/by-name/seccfg
	touch /dev/block/platform/mtk-msdc.0/by-name/secro
	touch /dev/block/platform/mtk-msdc.0/by-name/system
	touch /dev/block/platform/mtk-msdc.0/by-name/tee1
	touch /dev/block/platform/mtk-msdc.0/by-name/tee2
	touch /dev/block/platform/mtk-msdc.0/by-name/userdata
	touch /dev/block/platform/mtk-msdc.0/by-name/vbmeta
	touch /dev/block/platform/mtk-msdc.0/by-name/vendor

if [[ -n `busybox` ]]; then
   (
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/apd /dev/block/platform/mtk-msdc.0/by-name/apd          
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot /dev/block/platform/mtk-msdc.0/by-name/boot
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/cache /dev/block/platform/mtk-msdc.0/by-name/cache 
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/dkb /dev/block/platform/mtk-msdc.0/by-name/dkb
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/dtbo /dev/block/platform/mtk-msdc.0/by-name/dtbo
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/expdb /dev/block/platform/mtk-msdc.0/by-name/expdb
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/flashinfo /dev/block/platform/mtk-msdc.0/by-name/flashinfo
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/frp /dev/block/platform/mtk-msdc.0/by-name/frp
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/kb /dev/block/platform/mtk-msdc.0/by-name/kb
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/lk /dev/block/platform/mtk-msdc.0/by-name/lk
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/lk2 /dev/block/platform/mtk-msdc.0/by-name/lk2
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/logo /dev/block/platform/mtk-msdc.0/by-name/logo
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/metadata /dev/block/platform/mtk-msdc.0/by-name/metadata
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/nvram /dev/block/platform/mtk-msdc.0/by-name/nvram
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/nvrom /dev/block/platform/mtk-msdc.0/by-name/nvrom
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/para /dev/block/platform/mtk-msdc.0/by-name/para
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/persist /dev/block/platform/mtk-msdc.0/by-name/persist
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/proinfo /dev/block/platform/mtk-msdc.0/by-name/proinfo
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/protect1 /dev/block/platform/mtk-msdc.0/by-name/protect1
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/pertect2 /dev/block/platform/mtk-msdc.0/by-name/protect2
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery /dev/block/platform/mtk-msdc.0/by-name/recovery
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/seccfg /dev/block/platform/mtk-msdc.0/by-name/seccfg
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/secro /dev/block/platform/mtk-msdc.0/by-name/secro
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/system /dev/block/platform/mtk-msdc.0/by-name/system
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/tee1 /dev/block/platform/mtk-msdc.0/by-name/tee1
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/tee2 /dev/block/platform/mtk-msdc.0/by-name/tee2
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/userdata /dev/block/platform/mtk-msdc.0/by-name/userdata
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/vbmeta /dev/block/platform/mtk-msdc.0/by-name/vbmeta
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/vendor /dev/block/platform/mtk-msdc.0/by-name/vendor
    ) 2>/dev/null &
fi;

exit 0

