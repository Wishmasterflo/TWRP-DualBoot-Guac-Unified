
During the Dualboot-mod flashing you get a lot of options to choose from. 

You can select between A/B/(C) partition layout or stock partition layout (Dualbooting is only possible with A/B or A/B/C partition Layout not with Stock Layout!!)

If you want to have a extra partition (here called STOCKSD) on Stock Layout. That partition will be created with 1/3 of the storage size
(Note: That StockSD Layout seems not to work 100% yet. Looks like most of the ROMS just get a Bootloop then. Will have to check further on that!)

If you want to have a Common Data partition (C) on A/B/(C) Layout or not. If not the whole storage will be splitted to Data_A and Data_B partitions and you have a A/B layout for dualboot

The size of each data partition A and B (16 GB or 24 GB for the 64 GB devices, 16 GB, 32 GB, 40 GB, or 45 GB for the 128 GB devices and  16 GB , 32 GB , 64 GB , or 96 GB for the 256 GB devices) 
(the Common Data partition will get the rest of the space left)

If you want to disable encryption

Which file system to have on the slot and Common Data partition (F2FS or EXT4). The StockSD partition will get created as EXT4 partition
Info: You should just use EXT4 as file system in the first try! F2FS is not supported in all ROMS/Kernels!!

If you want to install Magisk (this will Install Magisk 21.4 as of now)
You need to choose to install Magisk from the Dualboot-mod while flashing if you want to use the Common Data or StockSD partition. The way I have implemented this now needs to use Magisk!

If you dont have the Common Data partition mounted or see the DualBoot Companion app installed after a ROM reflash please reboot to recovery and reflash the Dualboot-zip!!

From Version 5 onwards there is a Dualboot Companion app (made by User Invernomut0) added which can be used to reboot to other slots System or Recovery and it even will integrate in the reboot options from Android 11
The Dualboot Companion app has also the ability to share apps Data between both ROMs (this is still in beta/test!) and to mount the other slots Data or System partition
It will create a folder called "DualBoot" inside the SDCARD with folders for "SDcard_a" / "SDcard_b" and "System_a" / "System_b"
If you are using the A/B/C Layout and have activated the "Share app" function inside the Companion app it will create a folder "SharedData" inside of your Commondata folder for the apps you selected to share the data throughout both ROMs with
The app also shows additional information about the installed ROM Version, Android Version, and security Patch for each ROM

Dualboot-mod quickmode/fastmode options which can be provided directly through the Filename:

Dualboot_TWRP_fajita_enchilada_v5-fast-fec.ab-su.ab.zip


This can be used when you need to re-flash TWRP/OrangeFox recovery after a ROM install so that you dont need to go through all the options again.

For the first install or you want to re-partition you need to flash it without changes to the filename!


So the additional part "fast-fec.ab-su.ab" which is added to the filename is concluded like this:


"warp" = Quickmode/fastmode without any confirmation

"fast" or "quick" = Quickmode/fastmode which will just have one confirmation to flash the ZIP

"fec" = Force encryption

"su" = Magisk


The "ab" are the slots and these in small letters like a b means that that option is not getting installed/activated

When having "AB" in big letters means it will get installed/activated on that slot.

Examples like this:
- "Dualboot_TWRP_OP6t_fajita_v5-warp-fec.ab-su.ab.zip" - Fastmode enabled, Force encryption disabled on both slots, Magisk will not be installed on both slots
- "Dualboot_TWRP_OP6t_fajita_v5-warp-fec.Ab-su.ab.zip" - Fastmode enabled, Force encryption enabled on slot A and disabled on slot B, Magisk will not be installed on both slots
- "Dualboot_TWRP_OP6t_fajita_v5-warp-fec.AB-su.ab.zip" - Fastmode enabled, Force encryption enabled on both slots, Magisk will not be installed on both slots
- "Dualboot_TWRP_OP6t_fajita_v5-warp-fec.ab-su.Ab.zip" - Fastmode enabled, Force encryption disabled on both slots, Magisk will be installed on slot A but not on slot B
- "Dualboot_TWRP_OP6t_fajita_v5-warp-fec.ab-su.aB.zip" - Fastmode enabled, Force encryption disabled on both slots, Magisk will not be installed on slot A but will be installed on slot B
- "Dualboot_TWRP_OP6t_fajita_v5-warp-fec.ab-su.AB.zip" - Fastmode enabled, Force encryption disabled on both slots, Magisk will be installed on both slots



There is also a "failsafe" mode which can be activated when adding "failsafe" to the filename.

That is useful in case the Dualboot flasher is hanging when patching the inactive slot since that will

set the active slot as active on next boot so that you can use that slot since the other is without TWRP then an that case.


If you use the Common Data partition you can create a file in the root of that partition called: mounts.txt

In that file you can put folder names which are existing in your common data and these will get mounted directly over SDCARD on your Data_a and Data_b partition.

That could be useful if you have programs which wants to have their files in a specific directory on the Internal Storage.

For example if you have a folder Music on your common data that one will then be mounted directly to SDCARD/Music on both Data_a and Data_b partitions.

Note: That works only for folders with ONLY files inside! It is not working if you have another folder inside that one.