mkdir /storage/emulated/0/stocksd 2>/dev/null
if [ -f /system/etc/init/hw/init.rc ]; then
 mount -t sdcardfs -o rw,nosuid,nodev,noexec,noatime,fsuid=1023,fsgid=1023,gid=9997,mask=7,derive_gid,default_normal /stocksd /mnt/pass_through/0/emulated/0/stocksd
 else
 mount -t sdcardfs -o rw,nosuid,nodev,noexec,noatime,fsuid=1023,fsgid=1023,gid=9997,mask=7,derive_gid,default_normal /stocksd /storage/emulated/0/stocksd
exit 0 