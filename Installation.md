
Flashing instructions:
* Backup all your data since this process will repartition your phone and wipe all your data!
* Boot into your already installed TWRP (or just fastboot boot the TWRP.IMG for the Oneplus 6 series)
* Copy the Dualboot TWRP to /tmp on your phone (it will copy itself to /tmp if you try to flash it from somewhere else as well)
* If your current ROM/Userdata is encrypted do a FORMAT DATA in TWRP!
* reboot to recovery (TWRP) and select the slot you DO NOT want the ROM installed to (the ROM will always flash to the opposite slot!)
* Flash the Dualboot-TWRP.ZIP and go through all the options while flashing!
* reboot to recovery
* When you connect your phone now to your Computer it should show the Internal Storage from that slot as well as the Common Storage
* Copy the ROMS etc you want to flash to the Common Storage or Internal Storage if not using Common Storage
* From TWRP, Install (select Common Storage or Internal Storage) and install the first ROM
* When you are in Slot A and flash the ROM it will install to Slot B !!
  So keep in mind that the ROMS always flashes to the opposite slot.
* Flash the Dualboot-TWRP again (choose to keep your current Layout) (or flash your adjusted Dualboot-TWRP with quickmode options)
* reboot to recovery
* Switch to the other slot (so if you were in Slot A before, switch to Slot B now)
* Flash the ROM you want to have in the other slot
* Flash the Dualboot-TWRP again (choose to keep your current Layout)  (or flash your adjusted Dualboot-TWRP with quickmode options)
* reboot to recovery
* Switch to the other slot
* Do a FORMAT Data on that slot!
* Reboot System
* Now your ROM on that slot should boot up.
* It is only possible right now to set a PIN/password in OxygenOS in custom ROMs it is not possible to set a PIN/password!
* To switch between your ROMS boot into TWRP and switch the Slot to the one you want to boot up.
* Another method is to use the ROM Switcher shortcut Tool provided in the link below to reboot to the other ROM.
* For updating a ROM only do that via TWRP not with the OTA function from the ROM as that will break the Dualboot then!
* You need to reflash the Dualboot-TWRP after booted into the ROMs and set up Magisk in order to get the Common Data mounted!


