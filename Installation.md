
Flashing instructions:
* Backup all your data since this process will repartition your phone and wipe all your data!
* You should be on the latest OOS Version before proceeding
* Remove PIN/password to have your phone unencrypted before flashing the Dualboot-mod!
* Boot into your already installed TWRP/recovery (or just fastboot boot the TWRP.IMG for your Oneplus 6 phone)
* Flash the Dualboot-mod.ZIP and go through all the options while flashing!
  You can read more details about that here: https://github.com/Wishmasterflo/TWRP-DualBoot-Guac-Unified/blob/master/Text.md
* For first time flashing or if you want to repartition from A/B/C to Stock or StockSD, or the other way around you need to flash the Dualboot-mod from /tmp or USB Storage!
* (it will copy itself to /tmp if you try to flash it from somewhere else and want to repartition)
* Don't ADB sideload the Dualboot-mod. That will just cause errors!
* After all repartition processes do a reboot to recovery directly afterwards to apply all changes and get the partitions mounted correctly
  (after some repartition processes you see an error that /data or something else could not be mounted. That is OK. Just do a reboot to recovery again to get all changes applied!)
* reboot to recovery
* When you connect your phone now to your Computer it should show the Internal Storage from that slot as well as the Common Storage (if you have chosen the A/B/C Layout or StockSD if you use the StockSD Layout)
* Copy the ROMS etc you want to flash to the Common Storage, StockSD, or Internal Storage
* Reboot to recovery and select the slot you DO NOT want the ROM installed to (the ROM will always flash to the opposite slot!)
* From recovery, Install (select Common Storage, StockSD, or Internal Storage) and flash the latest OOS to get encrypted!
* From recovery, Install (select Common Storage, StockSD, or Internal Storage) and flash the first ROM
* When you are in Slot A and flash the ROM it will flash to Slot B !!
  So keep in mind that the ROMS always flashes to the opposite slot.
* Flash the Dualboot-mod again (choose to keep your current Layout) (or flash your adjusted Dualboot-mod with quickmode options)
* reboot to recovery to switch to the other slot (if you were in Slot A before, switch to Slot B now)
* Flash the ROM you want to have in the other slot
* Flash the Dualboot-mod again (choose to keep your current Layout) (or flash your adjusted Dualboot-mod with quickmode options)
* reboot to recovery
* Do a FORMAT Data on that slot!
* Reboot to System
* Now your ROM on that slot should boot up.
* You can only set a PIN/Password in one of the ROMs not on both.
* To switch between your ROMS you can now easily do this with the inbuild Dualboot Companion app. That will also integrate into the Power menu of Android 11 for easy rebooting to the other slot or recovery
* For updating a ROM only do that via recovery not with the OTA function from the ROM as that will break the Dualboot!
* You need to reflash the Dualboot-mod after booted into the ROMs and set up Magisk in order to get the Common Data or StockSD partition mounted
  


