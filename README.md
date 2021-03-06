# DualBoot TWRP/OrangeFox for the Oneplus 6 series

A big thanks to Zackptg5. The master of this mod from the beginning. I just adjusted this now to work on the Oneplus 6 series phones.

Modified TWRP (Mauronofrio's build) and installer script for Oneplus 6 series that re-purposes userdata for true dual booting. You can still use this as a regular stock twrp zip - one stop shop for magisk, verity, and/or forced encryption modifications.

You can choose to install this Dualboot-mod with a blacked themed TWRP or with OrangeFox recovery.

## Changelog
* 05/14/2021 - 3.5.2-9 v6
  * Updated Dualboot Companion app to V2.9.1
  DualBoot companion App V2.9.1 Changelog
  * Optimized splash screen
  * Fixed reboot time on Custom Rom in widget menu 

* 04/09/2021 - 3.5.2-9 v5.3
  * Updated TWRP to 3.5.2-9 (black Themed)
  * Updated Dualboot Companion app to V2.8.9
  DualBoot companion App V2.8.9 Changelog
  * Added Splash screen at start
  * Optimized starting time
  * Added free space on CommonData
  * Donate button 
  * Update Russian translation
  * bug fix here and there
  * Fixed Shortcuts
  * Fixed colours in updated box
  * Updated Italian and Russian translation
  * new logo
  * new info section
  * fixed crash using shortcuts
  * shared app updated:
  * Data Restore feature (it will copy the shared data back to /data/data and dismount the bind mount)
  * Data Delete feature (it will delete the shared data and dismount the bind mount)
  * Info about shared data if they are in place in shared directory

* 03/18/2021 - 3.5.1-9 v5.2
  * Updated with TWRP 3.5.1-9 (black Themed)

* 03/15/2021 - 3.5.0-9 v5.1
  * Updated Dualboot Companion app to V2.8.5
  * Added Dualboot with OrangeFox Recovery R11.0
  * Added Dualboot Logo to OrangeFox Recovery
  * You can now choose which recovery you want to use with the Dualboot. TWRP or OrangeFox Recovery
  * Fixed bug in partition size details for 64GB Oneplus 6 devices
  * Fixed error when flashing a ROM in OrangeFox recovery
  * Fixed hanging/timeout when rebooting to System or Recovery on Android 11 (works only when using reboot function from inside the Dualboot Companion app)

* 03/05/2021 - 3.5.0-9 v5
  * Added Dualboot Companion app created by User Invernomut0
  * small bugfixes and corrections

* 02/07/2021 - 3.5.0-9 v4.4
  * Fixed bug which caused that the quickmode options were not working

* 01/17/2021 - 3.5.0-9 v4.3
  * Updated with Magisk 21.4

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

## Limitations / issues
* You can only set a PIN/Password in one of the ROMs not on both.

## Some other features/notes
* Can choose between stock layout, a/b userdata, a/b/c userdata where 'c' is a common data partition that'll show up in both roms, or StockSD layout which will create a seperate partion on Stock layout
* Option to choose between ext4 and f2fs
* Disables verity - fstabs are modified for dual boot and so this is a must unless you choose stock layout in which case it's optional
* Option to disable forced encryption
* Option to install magisk
* From Version 5 onwards there is a Dualboot Companion app added which can be used to reboot to other slots System or Recovery and it even will integrate in the reboot options from Android 11
* The Dualboot Companion app has also the ability to share apps Data between both ROMs (this is still in beta/test!) and to mount the other slots Data or System partition

## Common Data
* If you choose a/b/c layout - you'll have a/b userdata, but you'll also get a 3rd userdata partition called 'Common Data'
* The name 'Common Data' gives away its purpose - to store files that you'll access on both slots/roms. So stuff like zips, Pictures, Music, etc.
* In recovery, this shows up as another storage option for backup/restore and on your pc as well - your phone will have 'Common Storage' and 'Internal Storage'
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
## Dualboot Companion app
* From Version 5 onwards there is a Dualboot Companion app (made by User Invernomut0) added to the Dualboot Recovery which can be used to reboot to other slots System or Recovery and it even will integrate in the reboot options from Android 11
* The Dualboot Companion app has also the ability to share apps Data between both ROMs (this is still in beta/test!) and to mount the other slots Data or System partition
  * It will create a folder called "DualBoot" inside the SDCARD with folders for "SDcard_a" / "SDcard_b" and "System_a" / "System_b"
  * If you are using the A/B/C Layout and have activated the "Share app" function inside the Companion app it will create a folder "SharedData" inside of your Commondata folder for the apps you selected to share the data throughout both ROMs with
  * The app also shows additional information about the installed ROM Version, Android Version, and security Patch for each ROM
  
## Flashing Instructions
* You MUST be booted into recovery already when flashing this Dualboot-mod.
* Since this modifies data - the zip CANNOT be on sdcard or data at all UNLESS you do not want to repartition/format
  * If you flash from data, the zip will copy itself to /tmp and instruct you to flash it from there
* Read through ALL the prompts - there's lots of options. 
* See more info here: https://github.com/Wishmasterflo/TWRP-DualBoot-Guac-Unified/blob/master/Text.md

## How to Flash Roms
* Nothing changes here except ONLY FLASH IN RECOVERY
  * Roms always flash to the opposite slot. Keep that in mind and you'll be fine
  * So don't take an OTA while booted - boot into recovery, switch slots, reboot into recovery, flash rom
* Normal flash procedure:
  * Boot into Recovery
  * Flash latest OOS (when doing a clean-flash!)
  * Flash rom (this will flash to the opposite slot)
  * Flash Dualboot-mod
  * Reboot to recovery
  * Flash everything else (GApps etc.)
  * Format data!

## Help! I Can't Boot!
* Usually this is because you switched roms without formatting data on that slot!


## Credits

* [Zackptg5](https://github.com/Zackptg5/TWRP-DualBoot-Guac-Unified)
* [Teamwin](https://github.com/TeamWin)
* [Mauronofrio](https://github.com/mauronofrio/android_device_oneplus_guacamole_unified_TWRP)
* [The OrangeFox Team]
* [TopJohnWu](https://github.com/topjohnwu/Magisk)
* [Ae3NerdGod](https://github.com/Ae3NerdGod)
* [Invernomut0](https://github.com/Invernomut0)
* [acuicultor](https://github.com/acuicultor)
* [Morphine1](https://github.com/morphine1)

## License

  MIT
