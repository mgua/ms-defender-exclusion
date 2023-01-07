# ms-defender-exclusion
Temporary inhibit of Microsoft defender realtime scan of specific Windows folders

I got constant problems in my Kali Linux wsl installation, because MS Defender was interfering with its updates.
Since WSL filesystem is shared with Windows, Microsoft Defender can see the linux files, scans them, and can block them.

Consistent problems happen when updating metasploit plugins, that trigger MS Defender detection. Files were moved to quarantine, or not allowed to be written.
I built this script to block MS defender scan of WSL folder, while performing apt upgrade in the kali linux window.

One update is done, simply pressing ENTER in the powershell script window allows original setup of MS Defender to be reactivated.

Thanks to Xavier Pollet for providing the reference to MS Defender powershell control commands.

Marco Guardigli, 2023 jan 07

