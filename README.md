# TWRP-DualBoot for the Oneplus 6 series

A big thanks to Zackptg5. The master of this mod from the beginning. I just adjusted this now to work on the Oneplus 6 series phones.

Modified TWRP (Mauronofrio's build) and installer script for Oneplus 6 series that re-purposes userdata for true dual booting. You can still use this as a regular stock twrp zip - one stop shop for magisk, verity, and/or forced encryption modifications.

I did a fork of the archived TWRP-Dualboot from the Oneplus 7 series done by user Zackptg5 and adjusted this to the Oneplus 6 series now.

## Changelog
* 01/16/2021 - 3.5.0-9 v4.2
  * Updated with Magisk 21.3

* 01/08/2021 - 3.5.0-9 v4.1
  * Cleaned up stuff which is not needed anymore
  * Fixed bugs that were existing in the repartitioning part
  * Updated with official TWRP 3.5.0-9 and added black Theme to it
  * Added option to create a seperate partition called StockSD when on Stock Layout

* 12/29/2020 - 3.4.0-0 v4
  * Updated with Magisk 21.2
  * Removed Magisk Canary 20422 since Magisk 21.2 is now working with TWRP and Android 11

* 12/01/2020 - 3.4.0-0 v3.3
  * Added to flash Magisk Canary 20422 on Android 11 automatically
  * Added mount file to mount Android Data to Commondata (still Beta/Test)

* 11/14/2020 - 3.4.0-0 v3.2
  * Updated with Magisk 21.1
  * Prepared script for some future features

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
* Always make a Backup of all your Data before using this.
* **YOU'VE BEEN WARNED - Use at your own risk**

## Limitation
* As of now it is only possible to set a PIN/password on OOS and not on any custom ROMs! 
* I had no luck in getting that fixed. Seems that it is something device specific to our Oneplus 6 series causing that this is not working on any other ROM than OOS
* since it was working on the DUALBOOT-TWRP for the Oneplus 7 where I took over this Project from in the beginnig.

## Some other features/notes
* Can choose between stock layout, a/b userdata, a/b/c userdata where 'c' is a common data partition that'll show up in both roms, or StockSD layout which will create a seperate partion on Stock layout
* Option to choose between ext4 and f2fs
* Disables verity - fstabs are modified for dual boot and so this is a must unless you choose stock layout in which case it's optional
* Option to disable forced encryption
* Option to install magisk

## Common Data
* If you choose a/b/c layout - you'll have a/b userdata, but you'll also get a 3rd userdata partition called 'Common Data'
* The name 'Common Data' gives away its purpose - to store files that you'll access on both slots/roms. So stuff like zips, Pictures, Music, etc.
* In TWRP, this shows up as another storage option for backup/restore and on your pc as well - your phone will have 'Common Storage' and 'Internal Storage'
  * The common data partition is mounted to /sdcard/CommonData
  * .nomedia file is placed in CommonData so files in it won't be picked up twice if you decide to mount over internal storage as outlined below
  * Furthermore, if your use case is like mine where my music files are in common data, you can make a 'mounts.txt' file in /datacommon containing a list of every FOLDER to mount directly over top of sdcard. So for example:<br/>
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
  * If you flash from data, the zip will copy itself to /tmp and instruct you to flash it from there
* Read through ALL the prompts - there's lots of options. 
* See more info here: https://github.com/Wishmasterflo/TWRP-DualBoot-Guac-Unified/blob/master/Text.md

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
* Usually this is because you switched roms without formatting data on that slot.


## Credits

* [Teamwin](https://github.com/TeamWin)
* [Mauronofrio](https://github.com/mauronofrio/android_device_oneplus_guacamole_unified_TWRP)
* [CosmicDan](https://github.com/CosmicDan-Android/android_system_update_engine_tissotmanager-mod)
* [TopJohnWu](https://github.com/topjohnwu/Magisk)
* [Zackptg5](https://github.com/Zackptg5/TWRP-DualBoot-Guac-Unified)

## License

  MIT
