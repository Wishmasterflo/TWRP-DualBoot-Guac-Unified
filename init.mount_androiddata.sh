if [ -f /system/etc/init/hw/init.rc ]; then
mount -t sdcardfs -o rw,nosuid,nodev,noexec,noatime,fsuid=1023,fsgid=1023,gid=9997,mask=7,derive_gid,default_normal /datacommon/data /system_root/data/data
mount -t sdcardfs -o rw,nosuid,nodev,noexec,noatime,fsuid=1023,fsgid=1023,gid=9997,mask=7,derive_gid,default_normal /datacommon/Android /mnt/pass_through/0/emulated/0/Android
else
mount -t sdcardfs -o rw,nosuid,nodev,noexec,noatime,fsuid=1023,fsgid=1023,gid=9997,mask=7,derive_gid,default_normal /datacommon/data /data/data 
mount -t sdcardfs -o rw,nosuid,nodev,noexec,noatime,fsuid=1023,fsgid=1023,gid=9997,mask=7,derive_gid,default_normal /datacommon/Android /sdcard/Android
