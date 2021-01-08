
Flashing instructions:
* Backup all your data since this process will repartition your phone and wipe all your data!
* Remove PIN/password to have your phone unencrypted before flashing the Dualboot-TWRP!!
* Boot into your already installed TWRP/recovery (or just fastboot boot the TWRP.IMG for your Oneplus 6 phone)
* For first time flashing or if you want to repartition from A/B/C to Stock or StockSD, or the other way around you need to flash the Dualboot-TWRP from /tmp or USB Storage!
* (it will copy itself to /tmp if you try to flash it from somewhere else and want to repartition)
* Don't ADB sideload the Dualboot TWRP. That will just cause errors!
* After all repartition processes do a reboot to TWRP directly afterwards to apply all changes and get the partitions mounted correctly
  (after some repartition processes you see an error that /data or something else could not be mounted. That is OK. Just do a reboot to TWRP again to get all changes applied!)
* Reboot to recovery (TWRP) and select the slot you DO NOT want the ROM installed to (the ROM will always flash to the opposite slot!)
* Flash the Dualboot-TWRP.ZIP and go through all the options while flashing!
  You can read more details about that here: https://github.com/Wishmasterflo/TWRP-DualBoot-Guac-Unified/blob/master/Text.md
* reboot to recovery
* When you connect your phone now to your Computer it should show the Internal Storage from that slot as well as the Common Storage (if you have chosen the A/B/C Layout or StockSD if you use the StockSD Layout)
* Copy the ROMS etc you want to flash to the Common Storage, StockSD, or Internal Storage
* From TWRP, Install (select Common Storage, StockSD, or Internal Storage) and install the first ROM
* When you are in Slot A and flash the ROM it will install to Slot B !!
  So keep in mind that the ROMS always flashes to the opposite slot.
* Flash the Dualboot TWRP again (choose to keep your current Layout) (or flash your adjusted Dualboot-TWRP with quickmode options)
* reboot to recovery
* Switch to the other slot (if you were in Slot A before, switch to Slot B now)
* Flash the ROM you want to have in the other slot
* Flash the Dualboot-TWRP again (choose to keep your current Layout) (or flash your adjusted Dualboot-TWRP with quickmode options)
* reboot to recovery
* Switch to the other slot
* Do a FORMAT Data on that slot!
* Reboot to System
* Now your ROM on that slot should boot up.
* It is only possible right now to set a PIN/password in OxygenOS in custom ROMs it is not possible to set a PIN/password!
* To switch between your ROMS boot into TWRP and switch the Slot to the one you want to boot up.
* For updating a ROM only do that via TWRP not with the OTA function from the ROM as that will break the Dualboot!
* You need to reflash the Dualboot-TWRP after booted into the ROMs and set up Magisk in order to get the Common Data or StockSD partition mounted
* When on Android 11 and have the Common Data mounted the phone will hang an a black screen for a minute or so when doing a reboot to System,Recovery,or Bootloader!
  (This happens when Android 11 tries to unmount the Common Data partiton)
  


