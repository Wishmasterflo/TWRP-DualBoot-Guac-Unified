#!/sbin/sh

chooseport() {
  while true; do
    getevent -lc 1 2>&1 | grep VOLUME | grep " DOWN" > $tmp/events
    if (`cat $tmp/events 2>/dev/null | grep VOLUME >/dev/null`); then
      break
    fi
  done
  if (`cat $tmp/events 2>/dev/null | grep VOLUMEUP >/dev/null`); then
    return 0
  else
    return 1
  fi
}

unmountAllAndRefreshPartitions() {
	mount | grep /dev/block/ | while read -r line ; do
		thispart=`echo "$line" | awk '{ print $3 }'`
		umount -lf $thispart
		sleep 0.5
	done
	stop sbinqseecomd
	sleep 1
	kill `pidof qseecomd` 2>/dev/null
	blockdev --rereadpt /dev/block/sda
  sleep 0.5
}

select_size() {
  ui_print " "
  ui_print "- Supported Partition Sizes for userdata:"
  [ $totsize -gt 128 ] && local sizes="16, 32, 64, or 96 GB" || local sizes="16, 32, 40, or 45 GB"
  ui_print "  $sizes"
  ui_print "  Common Data takes up whatever is left"
  sleep 1
  ui_print " "
  ui_print "  Choose Userdata Size:"
  for i in 16 32 40 45 64 96; do
    [ "$sizes" == "or $i GB" ] && { size=$i; return 0; }
    sizes="$(echo $sizes | sed -r "s/^$i, |^$i //g")"
    ui_print "  Vol+ $i GB; Vol- $sizes"
    chooseport && { size=$i; return 0; }
    ui_print " "
  done
}

select_format() {
  ui_print " "
  ui_print "- Ext4 or F2FS?"
  ui_print "  Note that your kernel must be f2fs compatible"
  ui_print "  Vol+ Ext4 (Recommended), Vol- F2FS"
  if [ "$layout" == "stock" ]; then
    chooseport && typea="ext4" || typea="f2fs"
  elif [ "$layout" == "stocksd" ]; then
    chooseport && typea="ext4" || typea="f2fs"
  else
    ui_print " "
    [ "$layout" == "a/b/c" ] && local slots="a b c" || local slots="a b"
    for i in $slots; do
      ui_print "  Slot $i?"
      chooseport && eval type$i="ext4" || eval type$i="f2fs"
    done
  fi
}

change_part() {
  local action=$1 partnum=$2 parttype=$3
  [ -z "$partnum" ] && abort "Partitioning error!"
  case $action in
    "delete") sgdisk /dev/block/sda --delete $partnum;;
    "new") sgdisk /dev/block/sda --new=$partnum;;
    "change-name") sgdisk /dev/block/sda --change-name=$partnum;;
    "format")
      local partsize=$(sgdisk --print /dev/block/sda | grep "^ *$partnum" | awk '{print $3-$2+1}')
      [ -z "$partsize" ] && abort "Formatting error!"
      local partname="$(sgdisk --print /dev/block/sda | grep "^ *$partnum" | awk '{gsub("_.*","",$7); print $7}' 2>/dev/null)"
      [ -z "$partname" ] && abort "Formatting error!"
      if [ "$parttype" == "f2fs" ]; then
        mkfs.f2fs -d1 -f -O encrypt -O quota -O verity -w 4096 /dev/block/sda$partnum $partsize
        sload.f2fs -t /data /dev/block/sda$partnum
      else
        mke2fs -F -F -t ext4 -b 4096 /dev/block/sda$partnum $partsize
        e2fsdroid -e -S /file_contexts -a /data /dev/block/sda$partnum
      fi
      ;;
	*) abort "Partitioning error!";;
  esac
  [ $? -eq 0 ] || abort "Partitioning error! You'll need to fix it manually!"
}

stock_userdata() {
  if [ "$curlayout" == "a/b" ]; then
      userdata_a_partline=$(sgdisk --print /dev/block/sda | grep -i 'userdata_a')
      userdata_a_partnum=$(echo "$userdata_a_partline" | awk '{ print $1 }')
      userdata_a_partend=$(echo "$userdata_a_partline" | awk '{ print $3 }')
      userdata_b_partline=$(sgdisk --print /dev/block/sda | grep -i userdata_b)
      userdata_b_partnum=$(echo "$userdata_b_partline" | awk '{ print $1 }')
	  userdata_b_partend=$(echo "$userdata_b_partline" | awk '{ print $3 }')
	  change_part delete $userdata_a_partnum
	  change_part delete $userdata_b_partnum
	  userdata_partend=$userdata_b_partend
      change_part new $userdata_partnum:$userdata_partstart:$userdata_partend
  fi	  
  if [ "$curlayout" == "stocksd" ]; then
      userdata_partline=$(sgdisk --print /dev/block/sda | grep -i 'userdata')
      userdata_partnum=$(echo "$userdata_partline" | awk '{ print $1 }')
      userdata_partend=$(echo "$userdata_partline" | awk '{ print $3 }')
      userdata_stocksd_partline=$(sgdisk --print /dev/block/sda | grep -i 'stocksd')
      userdata_stocksd_partnum=$(echo "$userdata_stocksd_partline" | awk '{ print $1 }')
      userdata_stocksd_partend=$(echo "$userdata_stocksd_partline" | awk '{ print $3 }')
      change_part delete $userdata_stocksd_partnum
      change_part delete $userdata_partnum
	  userdata_partend=$userdata_stocksd_partend
      change_part new $userdata_partnum:$userdata_partstart:$userdata_partend    	  
   fi  
   if [ "$curlayout" == "a/b/c" ]; then
      userdata_a_partline=$(sgdisk --print /dev/block/sda | grep -i 'userdata_a')
      userdata_a_partnum=$(echo "$userdata_a_partline" | awk '{ print $1 }')
      userdata_a_partend=$(echo "$userdata_a_partline" | awk '{ print $3 }')
      userdata_b_partline=$(sgdisk --print /dev/block/sda | grep -i userdata_b)
      userdata_b_partnum=$(echo "$userdata_b_partline" | awk '{ print $1 }')
	  userdata_b_partend=$(echo "$userdata_b_partline" | awk '{ print $3 }')
	  userdata_c_partline=$(sgdisk --print /dev/block/sda | grep -i 'userdata2')
      userdata_c_partnum=$(echo "$userdata_c_partline" | awk '{ print $1 }')
      userdata_c_partend=$(echo "$userdata_c_partline" | awk '{ print $3 }')
      change_part delete $userdata_a_partnum
	  change_part delete $userdata_b_partnum   
      userdata_partend=$userdata_c_partend
	  change_part delete $userdata_c_partnum
	  change_part new $userdata_partnum:$userdata_partstart:$userdata_partend
    fi
   change_part change-name $userdata_partnum:userdata
}

slot_userdata() {
	if [ "$layout" == "stocksd" ]; then
    typea="ext4"
	typed="ext4"
    userdata_length=`echo $((userdata_partend-userdata_partstart))`
    userdata_new=`echo $((userdata_length / 3))`
    userdata_new_partend=`echo $((userdata_partstart+userdata_new))`
    userdata_stocksd_partstart=`echo $((userdata_new_partend+1))`
    userdata_stocksd_partnum=`echo $((userdata_partnum+1))`
    change_part delete $userdata_partnum
    change_part new $userdata_partnum:$userdata_partstart:$userdata_new_partend
    change_part change-name $userdata_partnum:userdata
    change_part new $userdata_stocksd_partnum:$userdata_stocksd_partstart:$userdata_partend
    change_part change-name $userdata_stocksd_partnum:stocksd
	
	elif [ "$layout" == "a/b/c" ]; then
		# Calculate size for $size partition with 4k logical sector size
    userdata_newpartsize=$((size * 1024 * 1024 / 4))
    userdata_a_partend=`echo $((userdata_partstart+userdata_newpartsize))`

    userdata_b_partstart=`echo $((userdata_a_partend+1))`
    userdata_b_partend=`echo $((userdata_b_partstart+userdata_newpartsize))`
    userdata_b_partnum=$(echo $((`sgdisk --print /dev/block/sda | awk 'END{print $1}'`+1)))
	
    userdata_c_partstart=`echo $((userdata_b_partend+1))`
    userdata_c_partnum=`echo $((userdata_b_partnum+1))`
	
	change_part delete $userdata_partnum
  	change_part new $userdata_partnum:$userdata_partstart:$userdata_a_partend 
    change_part change-name $userdata_partnum:userdata_a
	change_part new $userdata_b_partnum:$userdata_b_partstart:$userdata_b_partend
    change_part change-name $userdata_b_partnum:userdata_b
  
	else
		# Cut it in half
	userdata_length=`echo $((userdata_partend-userdata_partstart))`
    userdata_newpartsize=`echo $((userdata_length / 2))`
	userdata_a_partend=`echo $((userdata_partstart+userdata_newpartsize))`

    userdata_b_partstart=`echo $((userdata_a_partend+1))`
    userdata_b_partend=$userdata_partend
    userdata_b_partnum=`echo $((userdata_partnum+1))`
	
	change_part delete $userdata_partnum
  	change_part new $userdata_partnum:$userdata_partstart:$userdata_a_partend 
    change_part change-name $userdata_partnum:userdata_a
	change_part new $userdata_b_partnum:$userdata_b_partstart:$userdata_b_partend
    change_part change-name $userdata_b_partnum:userdata_b
    fi

	if [ "$layout" == "a/b/c" ]; then
    change_part new $userdata_c_partnum:$userdata_c_partstart:$userdata_partend
    change_part change-name $userdata_c_partnum:userdata2
  fi
  blockdev --rereadpt /dev/block/sda
	sleep 0.5
	ui_print "  Formatting new userdata partitions"
	change_part format $userdata_partnum $typea
  [ "$layout" == "stocksd" ] && change_part format $userdata_stocksd_partnum $typed
  [ "$layout" == "a/b" ] && change_part format $userdata_b_partnum $typeb
  [ "$layout" == "a/b/c" ] && change_part format $userdata_b_partnum $typeb
  [ "$layout" == "a/b/c" ] && change_part format $userdata_c_partnum $typec
  ui_print "  Userdata has been partitioned to $layout"
}

repartition_userdata() {
  ui_print " "
   if [ "$curlayout" == "stocksd" ]; then
        userdata_partline=$(sgdisk --print /dev/block/sda | grep -i 'userdata')	
   elif [ "$curlayout" == "stock" ]; then
		userdata_partline=$(sgdisk --print /dev/block/sda | grep -i 'userdata$')
  else
		userdata_partline=$(sgdisk --print /dev/block/sda | grep -i userdata_a)
	fi
	userdata_partnum=$(echo "$userdata_partline" | awk '{ print $1 }')
	userdata_partstart=$(echo "$userdata_partline" | awk '{ print $2 }')
	userdata_partend=$(echo "$userdata_partline" | awk '{ print $3 }')
	userdata_partname=$(echo "$userdata_partline" | awk '{ print $7 }')
  case $layout in
    "stock") 
      ui_print "- Repartitioning userdata back to stock"
      stock_userdata   
      blockdev --rereadpt /dev/block/sda
      sleep 0.5
      ui_print "  Formatting userdata"
      change_part format $userdata_partnum $typea
      ui_print "  Userdata has been repartitioned back to stock"
      ;;
    *)
      ui_print "- Repartitioning userdata to $layout"
      [ "$curlayout" == "stock" ] || stock_userdata
      slot_userdata
      ;;
  esac
}

reset_slot() {
  slot=$(getprop ro.boot.slot_suffix 2>/dev/null)
  test "$slot" || slot=$(grep -o 'androidboot.slot_suffix=.*$' /proc/cmdline | cut -d\  -f1 | cut -d= -f2)
  if [ ! "$slot" ]; then
    slot=$(getprop ro.boot.slot 2>/dev/null)
    test "$slot" || slot=$(grep -o 'androidboot.slot=.*$' /proc/cmdline | cut -d\  -f1 | cut -d= -f2)
    test "$slot" && slot=_$slot
  fi;
  if [ "$slot" ]; then
    case $slot_select in
      inactive)
        case $slot in
          _a) slot=_b;;
          _b) slot=_a;;
        esac
      ;;
    esac
  fi
  [ -z $slot ] && abort "Unable to determine active boot slot! Aborting!"
}

patch_fstabs() {
	ui_print "  Patching fstabs:"
	for i in $FSTABS; do
		[ -f $i ] || continue
		ui_print "    $i"
    local perm="$(ls -Z $i | awk '{print $1}')"
		sed -ri "
      s/,verifyatboot|verifyatboot,|verifyatboot\b//g
      s/,verify|verify,|verify\b//g
      s/,avb_keys|avb_keys,|avb_keys\b//g
      s/,avb|avb,|avb\b//g
      s/,support_scfs|support_scfs,|support_scfs\b//g
      s/,fsverity|fsverity,|fsverity\b//g
    " "$i"
    $KEEPFORCEENCRYPT || sed -i "s/fileencryption=/=/g" $i
    sed -i "/data2/d" $i
		sed -i "/name\/userdata / s/wait,slotselect/wait/" $i
    while true; do
      [ "$(tail -n1 $i)" ] && { echo >> $i; break; } || sed -i '$d' $i
    done    
	[ "$layout" == "stock" ] || sed -i "/name\/userdata / s/wait,/wait,slotselect,/" $i
		chcon $perm $i
	done
}

#########################################
#
# Magisk General Utility Functions
# by topjohnwu
#
#########################################

binary_patches() { # Modified
	for dt in dtb kernel_dtb extra recovery_dtbo; do
		[ -f $dt ] && magiskboot dtb $dt patch && ui_print "    Patch fstab in $dt"
	done

	if [ -f kernel ]; then
    if $magisk; then
      # Force kernel to load rootfs
      # skip_initramfs -> want_initramfs
      magiskboot hexpatch kernel \
      736B69705F696E697472616D667300 \
      77616E745F696E697472616D667300
    else
      # want_initramfs -> skip_initramfs
      magiskboot hexpatch kernel \
      77616E745F696E697472616D6673 \
      736B69705F696E697472616D6673
    fi
	fi
}

###################
# Helper Functions
###################

toupper() {
  echo "$@" | tr '[:lower:]' '[:upper:]'
}

grep_prop() {
  local REGEX="s/^$1=//p"
  shift
  local FILES=$@
  [ -z "$FILES" ] && FILES='/system/build.prop'
  sed -n "$REGEX" $FILES 2>/dev/null | head -n 1
}

#######################
# Installation Related
#######################

find_block() {
  for BLOCK in "$@"; do
    DEVICE=`find /dev/block -type l -iname $BLOCK | head -n 1` 2>/dev/null
    if [ ! -z $DEVICE ]; then
      readlink -f $DEVICE
      return 0
    fi
  done
  # Fallback by parsing sysfs uevents
  for uevent in /sys/dev/block/*/uevent; do
    local DEVNAME=`grep_prop DEVNAME $uevent`
    local PARTNAME=`grep_prop PARTNAME $uevent`
    for BLOCK in "$@"; do
      if [ "`toupper $BLOCK`" = "`toupper $PARTNAME`" ]; then
        echo /dev/block/$DEVNAME
        return 0
      fi
    done
  done
  return 1
}

patch_dtb_partitions() { # Modified
  set +x
  local result=1
  for name in dtb dtbo; do
    local IMAGE=`find_block $name$slot`
    if [ ! -z $IMAGE ]; then
      ui_print "    $name image: $IMAGE"
      if magiskboot dtb $IMAGE patch dt.patched; then
        result=0
				$magisk && { ui_print "    Backing up stock $name image"
        cat $IMAGE > stock_${name}.img; }
        ui_print "    Flashing patched $name"
        cat dt.patched /dev/zero > $IMAGE
        rm -f dt.patched
      fi
    fi
  done
  set -x
  return $result
}

run_migrations() {
  local LOCSHA1
  local TARGET
  # Legacy app installation
  local BACKUP=/data/adb/magisk/stock_boot*.gz
  if [ -f $BACKUP ]; then
    cp $BACKUP /data
    rm -f $BACKUP
  fi

  # Legacy backup
  for gz in /data/stock_boot*.gz; do
    [ -f $gz ] || break
    LOCSHA1=`basename $gz | sed -e 's/stock_boot_//' -e 's/.img.gz//'`
    [ -z $LOCSHA1 ] && break
    mkdir /data/magisk_backup_${LOCSHA1} 2>/dev/null
    mv $gz /data/magisk_backup_${LOCSHA1}/boot.img.gz
  done

  # Stock backups
  LOCSHA1=$SHA1
  for name in boot dtb dtbo; do
    BACKUP=/data/adb/magisk/stock_${name}.img
    [ -f $BACKUP ] || continue
    if [ $name = 'boot' ]; then
      LOCSHA1=`$MAGISKBIN/magiskboot sha1 $BACKUP`
      mkdir /data/magisk_backup_${LOCSHA1} 2>/dev/null
    fi
    TARGET=/data/magisk_backup_${LOCSHA1}/${name}.img
    cp $BACKUP $TARGET
    rm -f $BACKUP
    gzip -9f $TARGET
  done
}

#################
# Module Related
#################

set_perm() {
  chown $2:$3 $1 || return 1
  chmod $4 $1 || return 1
  CON=$5
  [ -z $CON ] && CON=u:object_r:system_file:s0
  chcon $CON $1 || return 1
}
