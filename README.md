# EDK2 UEFI firmware porting attempt for Google Pixel 6 (and other Tensor devices)

This repo is based on Renegade Project (edk2-msm). 
It will contain the old files and the file structure for the time being.

The folder layout and the way the project builds are bound to change a lot.

The current state of the project is that it boots the image successfully (just the Google logo remains on screen), configures the MMU and hangs somewhere in the beginnning of DxeCore. Most likely the memory map is incorrect.

## Enabling PStore debugging (necessary for now)  
Run the following commands:
```
fastboot oem ramdump usb
fastboot oem ramdump compression disable
fastboot oem ramdump encryption disable
fastboot oem ramdump config
```

As you can see, these commands will turn your phone into a security hole, so only run them if you are comfortable with that.

## Building and running
Simply execute ``./raven-build-and-run.sh`` with your phone eplugged in and in fastboot. After double clicking the power button and waiting for a minute, hold the volume down to get back into fastboot and to get logs

[This](https://pastebin.com/NnC4Bvs8) is what you should expect for now.

## Memory map
The memory map located at ``Silicon/Google/Tensor/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.c`` is based off of the ouput of ``cat /proc/iomem`` and almost certainly needs work on it done.

## Telegram group chat and contributing to the project
Any and all help i can give or receive should go through this [Telegram group](https://t.me/+qsKNlVPyjSo3NGM0)


## Acknowledgements
- Gustave Monce and his [SurfaceDuoPkg](https://github.com/WOA-Project/SurfaceDuoPkg)
- [DuoWoa Project](https://github.com/WOA-Project)
- [EFIDroid](https://github.com/efidroid)
- [Ben (Bingxing) Wang](https://github.com/imbushuo/)
- [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg)
- BigfootACA and his [SimpleInit](https://github.com/BigfootACA/simple-init) and [LinuxSimpleMassStorage](https://github.com/BigfootACA/linux-simple-mass-storage)
- fxsheep and his original edk2-sagit
- All the developers and members of [Renegade Project](https://github.com/edk2-porting/) for offering efforts, equipments, valuable documents and more

## License
All code except drivers in GPLDriver directory are licensed under BSD 2-Clause. GPL Drivers are licensed under GPLv2 license.
