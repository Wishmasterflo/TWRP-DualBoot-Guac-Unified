# TWRP-DualBoot-fajita-enchilada

A big thanks to Zackptg5. The master of this mod from the beginning. I just adjusted this now to work on the Oneplus 6 series phones.

Modified TWRP (Mauronofrio's build) and installer script for Oneplus 6 series that re-purposes userdata for true dual booting. You can still use this as a regular stock twrp zip - one stop shop for magisk, verity, and/or forced encryption modifications.

I did a fork of the archived TWRP-Dualboot from the Oneplus 7 series done by user Zackptg5 and adjusted this to the Oneplus 6 series now.

## Changelog
* 10/30/2020 - 3.4.0-0 v3.1
  * Removed unnessessary stuff which was left from the Oneplus 7 devices
  * Fixed Common data mount script for Android 11
  * Magisk 20.4
  * Dualboot-TWRP can be flashed from USB Storage as well now

* 10/20/2020 - 3.4.0-0 v3
  * Added Blackout TWRP Themed by acuicultor and Morphine1
  * Added support/detection for 64GB Oneplus 6 enchilada devices
  * Added that Magisk 21.0 does not get flashed on Android 11 ROMs (as that is not working now!)
  * removed automatic launch of Common data mount script on Android 11 as that caused strange behaviour when rebooting the phone!
  * Some more small adjustments in the flashing script
  * Adjusted sizes for the userdata partitions when using A/B/C Layout as follows: 
    64GB    16, 24 GB partition size for A/B/C Layout
	128GB   16, 32, 40, 45 GB partition size for A/B/C Layout
	256GB   16, 32, 64, 96 GB partition size for A/B/C Layout

* 10/17/2020 - 3.4.0-0 v2.3
  * Fixed mounting of Common data partition
  
* 10/15/2020 - 3.4.0-0 v2.2
  * Fixed better detection of Android 11 Installed ROMS
  * Build Dualboot Installer for Oneplus 6 enchilada

* 10/13/2020 - 3.4.0-0 v2.1
  * Fixed hanging when on Android 11

* 10/12/2020 - 3.4.0-0 v2
  * Fixed automatic Formatting and creating of the partitions
  * added quickmode options which can be provided directly to the ZIP file name
  * A lot of other bugfixes and improvments
  
* 10/06/2020 - 3.4.0-0 v1
  * Initial Release v1 modified Dualboot TWRP for the Oneplus 6/6t
  * Updated with Magisk 21.0

## Disclaimer
* I am not responsible for anything bad that happens to your device. Only experienced users should be using this mod
* This is no walk in the park mod. Although I have extensively tested it, there is always the possibility of a brick with anything that involves repartitioning. 
Make sure you have a backup and know how to reparititon your phone back to stock (there's a guide at the end of this readme with the basics)
* **YOU'VE BEEN WARNED - Use at your own risk**

## Limitation
* If you set a password, regardless of encryption status, it'll corrupt the other slot if it's also password protected. 
* Note that some roms set one automatically
Either don't use a password on one slot, or leave one slot (I'll use 'a' in this example) **unencrypted** and:
  * Setup rom, password, and everything on slot a
  * Boot back into twrp, choose common data as storage, and backup userdata (if not using a/b/c layout, backup TWRP folder to your computer)
  * Setup rom, password, and everything on the other slot (b)
  * Boot back into twrp, switch back to slot a (reboot back into twrp), and restore the twrp backup
* If you messed this up and are unencrypted - delete these files in /data/system if present: locksettings.db gatekeeper.password.key password.key gatekeeper.pattern.key pattern.key gatekeeper.gesture.key gesture.key
* If you messed this up and are encrypted - you lost the data on that slot:
  * Unmount metadata in twrp gui
  * Format metadata with this command: `mke2fs -t ext4 -b 4096 /dev/block/sda$metadata_partnum` where *metadata_partnum* is the partition number of the current metadata partition (you can find this with `sgdisk /dev/block/sda --print`). DO NOT FORGET THE PARTITION NUMBER. If you do, you'll format all of sda which results in a brick
  * Reboot into twrp and format data in gui

## Some other features/notes
* Can choose between stock layout, a/b userdata, or a/b/c userdata where 'c' is a common data partition that'll show up in both roms - it's quite handy
* Option to choose between ext4 and f2fs
* Disables verity - fstabs are modified for dual boot and so this is a must unless you choose stock layout in which case it's optional
* Option to disable forced encryption
* Option to install magisk

## Common Data
* If you choose a/b/c layout - you'll have a/b userdata, but you'll also get a 3rd userdata partition I call 'Common Data'
* The name 'Common Data' gives away its purpose - to store files that you'll access on both slots/roms. So stuff like zips, pictures, music, TWRP backups, etc.
* In TWRP, this shows up as another storage option for backup/restore and on your pc as well - your phone will have 'Common Storage' and 'Internal Storage'
* In order to be accessible when booted, some parts of the system are modified so that the it'll be accessible WITHOUT root by the following mechanisms:
  * The common data partition is mounted to /sdcard/CommonData
  * .nomedia file is placed in CommonData so files in it won't be picked up twice if you decide to mount over internal storage as outlined below
  * Furthermore, if your use case is like mine where my music files are in common data, you can make 'mounts.txt' file in /datacommon containing a list of every FOLDER to mount directly over top of sdcard. So for example:<br/>
  /datacommon/Music -> /sdcard/Music
    * This of course mounts over anything there (overwrites it for as long as it's mounted) so make sure that you don't have the same folder in both datacommon and regular data
    * Note that there are 3 exceptions to this folder mounting rule:
      * All - if this is the FIRST line, ALL folders in datacommon will be mounted
      * Android
      * lost+found
    * The reasoning should be obvious - lost+found isn't something you should need to mess with and Android is for regular data partition only - that's OS specific and should be on separate slots
    * Note that you should have 1 folder listed on every line, for example:
      ```DCIM
      Music
      Pictures
      ViPER4AndroidFX
      ```

## Flashing Instructions
* You MUST be booted into TWRP already when flashing this zip.
* Since this modifies data - the zip CANNOT be on sdcard or data at all UNLESS you do not want to repartition/format
  * If you flash from data, the zip will copy itself to /tmp and instruct you to flash it from there OR you can just install twrp/magisk/disver-fec
  * You could do the above or copy it to a place like /dev or /tmp and flash it from there
  * Alternatively, you can adb sideload it
* Read through ALL the prompts - there's lots of options :)

## How to Flash Roms
* Nothing changes here except ONLY FLASH IN TWRP
  * Roms always flash to the opposite slot. Keep that in mind and you'll be fine
  * So don't take an OTA while booted - boot into twrp, switch slots, reboot into twrp, flash rom
* Normal flash procedure:
  * Boot into twrp
  * reboot into twrp selecting slot you do NOT want rom installed to
  * Flash rom
  * Flash this zip
  * Reboot into twrp
  * Flash everything else

## Help! I Can't Boot!
* Usually this is because you switched roms without formatting data first. This should be flashing 101 but we all forget sometimes. Plus this slot stuff can get confusing
* If it only happens with a/b/c and not any other layout, there's a good chance it's selinux related. Try setting selinux to permissive at kernel level [with this mod](https://zackptg5.com/android.php#ksp) ([source here](https://github.com/Zackptg5/Kernel-Sepolicy-Patcher)).


## How to Manually Repartition Back to Stock
* In the event any step in the repartioning fails, the entire installer aborts. The good news is that this prevents a potential brick. The bad is that you need to manually revert back
* Boot into twrp. If sgdisk is not present in sbin, grab it from this zip (in tools) and adb push it to /sbin and chmod +x it
* `sgdisk /dev/block/sda --print` Note that /dev/block/sda is the block that userdata and metadata are stored on - no other block is touched by this mod. 
This will show up the current partition scheme. Stock looks something like this (on OP7 Pro):
```
Number  Start (sector)    End (sector)  Size       Code  Name
   1               6               7   8.0 KiB     FFFF  ssd
   2               8            8199   32.0 MiB    FFFF  persist
   3            8200            8455   1024.0 KiB  FFFF  misc
   4            8456            8711   1024.0 KiB  FFFF  param
   5            8712            8839   512.0 KiB   FFFF  keystore
   6            8840            8967   512.0 KiB   FFFF  frp
   7            8968           74503   256.0 MiB   FFFF  op2
   8           74504           77063   10.0 MiB    FFFF  oem_dycnvbk
   9           77064           79623   10.0 MiB    FFFF  oem_stanvbk
  10           79624           79879   1024.0 KiB  FFFF  mdm_oem_dycnvbk
  11           79880           80135   1024.0 KiB  FFFF  mdm_oem_stanvbk
  12           80136           80263   512.0 KiB   FFFF  config
  13           80264          969095   3.4 GiB     FFFF  system_a
  14          969096         1857927   3.4 GiB     FFFF  system_b
  15         1857928         1883527   100.0 MiB   FFFF  odm_a
  16         1883528         1909127   100.0 MiB   FFFF  odm_b
  17         1909128         1913223   16.0 MiB    FFFF  metadata
  18         1913224         1945991   128.0 MiB   FFFF  rawdump
  19         1945992        61409274   226.8 GiB   FFFF  userdata
```
You may have different size userdata - mine is 256gb - depending on your device but that doesn't matter. You just need to see where they're located<br/>
Take note of the **number** (I'll call *userdata_num* for the sake of this tutorial) and **start sector** (*userdata_start*) for the first partition AFTER rawdump, and the **end sector** (*userdata_end*) of the last parititon on sda

* `sgdisk /dev/block/sda --change-name=17:metadata` - renames metadata partition back to non-ab stock
* `sgdisk /dev/block/sda --delete=19` - this deletes the entire partition - use this command for each user/metadata partition after rawdump (ones generated by this zip)
* `sgdisk /dev/block/sda --new=$userdata_num:$userdata_start:$userdata_end --change-name=$userdata_num:userdata` - this creates the new userdata partition
* Final step is to format the new userdata partition: `mke2fs -t ext4 -b 4096 /dev/block/sda$userdata_num $userdata_size` - where *userdata_size* can be calculated with this shell command: `sgdisk /dev/block/sda --print | grep "^ *$userdata_num" | awk '{print $3-$2+1}'`
  * MAKE SURE YOU VERIFY ALL VARIABLES HERE ARE SET PROPERLY - if you mess this up, you could format all of sda resulting in a brick
* Run `sgdisk /dev/block/sda --print` again to make sure everything is correct and then reboot back into twrp


## Credits

* [Teamwin](https://github.com/TeamWin)
* [Mauronofrio](https://github.com/mauronofrio/android_device_oneplus_guacamole_unified_TWRP)
* [CosmicDan](https://github.com/CosmicDan-Android/android_system_update_engine_tissotmanager-mod)
* [TopJohnWu](https://github.com/topjohnwu/Magisk)
* [Zackptg5](https://github.com/Zackptg5/TWRP-DualBoot-Guac-Unified)

## License

  MIT
