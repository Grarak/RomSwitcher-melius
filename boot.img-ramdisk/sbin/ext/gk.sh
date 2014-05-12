#!/sbin/busybox sh

mount -o remount,rw /system
/sbin/busybox mount -t rootfs -o remount,rw rootfs

mount -t tmpfs tmpfs /system/lib/modules

ln -s /lib/modules/* /system/lib/modules/

echo 2 > /sys/devices/system/cpu/sched_mc_power_savings
echo 1728000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 162000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 1 > /sys/kernel/dyn_fsync/Dyn_fsync_active

ln -s /res/synapse/uci /sbin/uci
/sbin/uci

/sbin/busybox mount -t rootfs -o remount,ro rootfs
mount -o remount,ro /system
