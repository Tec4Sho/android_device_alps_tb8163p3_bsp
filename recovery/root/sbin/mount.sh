#!/sbin/sh
##
## LEGACY Partitions binder.
## Logging on recovery startup saved in cache/logs & data/media/0/TWRP - Fox. 
## Runs logging by creating empty file name (log) placed in TWRP or Fox folder.
##

log='/cache/logs/custom-recovery.log';
file1='/data/media/0/TWRP/log';
file2='/data/media/0/Fox/log';
file3='/data/media/0/TWRP/tw-recovery.log';
file4='/data/media/0/Fox/of-recovery.log';

resetprop ro.sf.hwrotation 270 2>/dev/null;
resetprop ro.build.characteristics tablet 2>/dev/null;
resetprop ro.mtk_is_tablet 1 2>/dev/null;
resetprop windowsmgr.support_rotation_270 true 2>/dev/null;
setprop modules.loaded 1 
setprop vendor.all.modules.ready 1

# Check log for twrp mount.sh started
log 'MOUNT.SH was started successfully' 2>/dev/null;
	 
	[[ ! -d $(dirname $log) ]] && mkdir -p /cache/logs;

	if [ -f $log ]; then
		mv -f $log ${log}.old;
	fi;
	
	if [ -f $file1 ] || [ -f $file2 ]; then
		resetprop persist.log.tag V 2>/dev/null;
		resetprop persist.logd.logpersistd true 2>/dev/null;
		resetprop ro.logd.kernel true 2>/dev/null;
		setprop logcat.live true 2>/dev/null;
		resetprop ro.boot.meta_log_disable 0 2>/dev/null;
		log 'TWRP CUSTOM RECOVERY LOGGING WAS STARTED' 2>/dev/null;
		echo '#' >> $log;
		echo '### PROC MODULES ###' >> $log;
		echo '#' >> $log;
		cat /proc/modules >> $log 2>&1;
		echo '#' >> $log;
		echo '### LSMOD MODULES ###' >> $log;
		echo '#' >> $log;
		lsmod >> $log 2>&1;
		echo '#' >> $log;
		echo '### DUMPSYS CPUINFO ###' >> $log;
		echo '#' >> $log;
		dumpsys cpuinfo >> $log 2>&1;
		echo '#' >> $log;
		echo '### LOGCAT FULLY LOGGED ###' >> $log;
		echo '#' >> $log;
		logcat -d -b 'all' -f $log 2>&1 || echo 'logcat not running' >> $log;
		echo '#' >> $log;
		echo '### DMESG RECOVERY LOGGED ###' >> $log;
		echo '#' >> $log;
		dmesg -c >> $log;
		echo '#' >> $log;
        log 'TWRP CUSTOM RECOVERY LOGGING WAS STOPPED.... LOG BUFFER CLEANED' 2>/dev/null;
	fi;

    if [ -f $file1 ]; then
	    cp -f ${log} ${file3} 2>/dev/null;
    elif [ -f $file2 ]; then
	    cp -f ${log} ${file4} 2>/dev/null;
	fi;
  
## Get your device's block path where "system", "recovery", etc. lives.
# That can be "/dev/block/bootdevice/by-name" or something like that.

mkdir -p /dev/block/platform/mtk-msdc.0/by-name/
cd /dev/block/platform/tk-msdc.0/by-name/
touch apd boot cache dkb dtbo expdb flashinfo frp kb lk lk2 logo metadata nvram nvrom para persist proinfo protect1 protect2 recovery seccfg secro system tee1 tee2 userdata vbmeta vendor

# Full device partition MOUNT list
if [[ -n `busybox` ]]; then
   (
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/apd /dev/block/platform/mtk-msdc.0/by-name/apd          
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot /dev/block/platform/mtk-msdc.0/by-name/boot
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/cache /dev/block/platform/mtk-msdc.0/by-name/cache 
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/dkb /dev/block/platform/mtk-msdc.0/by-name/dkb
	busybox mount -o bind /dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/dtbo /dev/block/platform/mtk-msdc.0/by-name/dtbo
	busybox mount -o bind/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/expdb /dev/block/platform/mtk-msdc.0/by-name/expdb
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

