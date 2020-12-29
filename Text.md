
During the Dualboot-TWRP flashing you get a lot of options to choose from. 

You can select between A/B/(C) partition layout or stock partition layout (Dualbooting is only possible with A/B or A/B/C partition Layout not with Stock Layout!!)

If you want to have a Common Data partition (C) or not. If not the whole storage will be splitted to Data_A and Data_B partitions and you have a A/B layout for dualboot

The size of each data partition A and B (16 GB or 24 GB for the 64 GB devices, 16 GB, 32 GB, 40 GB, or 45 GB for the 128 GB devices and  16 GB , 32 GB , 64 GB , or 96 GB for the 256 GB devices) 
(the Common Data partition will get the rest of the space left)

If you want to disable encryption

Which file system to have on the slot (F2FS or EXT4)

If you want to install Magisk (this will Install Magisk 21.2)
You need to choose to install Magisk from the Dualboot-TWRP while flashing if you want to use the Common Data partition. The way I have implemented this now needs to use Magisk!


Dualboot TWRP quickmode/fastmode options which can be provided directly through the Filename:

Dualboot_TWRP_fajita_enchilada_v3-fast-fec.ab-su.ab.zip


This can be used when you need to re-flash TWRP after a ROM install so that you dont need to go through all the options again.

For the first install or you want to re-partition you need to flash it without changes to the filename!


So the additional part "fast-fec.ab-su.ab" which is added to the filename is concluded like this:


"fast" or "quick" = Quickmode/fastmode which will just have one confirmation to flash the ZIP

"fec" = Force encryption

"su" = Magisk


The "ab" are the slots and these in small letters like a b means that that option is not getting installed/activated

When having "AB" in big letters means it will get installed/activated on that slot.


So when having "fec.Ab-su.AB" Force encryption will be enabled on slot A but not on slot b. And Magisk will be installed on both A and B.


There is also a "failsafe" mode which can be activated when adding "failsafe" to the filename.

That is useful in case the Dualboot flasher is hanging when patching the inactive slot since that will

set the active slot as active on next boot so that you can use that slot since the other is without TWRP then an that case.


If you use the Common Data partition you can create a file in the root of that partition called: mounts.txt

In that file you can put folder names which are existing in your common data and these will get mounted directly over SDCARD on your Data_a and Data_b partition.

That could be useful if you have programs which wants to have their files in a specific directory on the Internal Storage.

For example if you have a folder Music on your common data that one will then be mounted directly to SDCARD/Music on both Data_a and Data_b partitions.

Note: That works only for folders with ONLY files inside! It is not working if you have another folder inside that one.