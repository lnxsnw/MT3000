# lnxsnw/MT3000
Personal modifications to the GL-iNET MT3000 Beryl AX Travel Router.

Currently, this includes the following modifications:
- For the admin page: redirect the user to HTTPS if user is not, and with tweaks for AGH.
- Auto (by Script) Update, Memory tweaks, and offline blocklist fallback for AdGuardHome
- You can just quickly set it up by copypasting: 
	- `cd /tmp`
	- `wget https://github.com/lnxsnw/MT3000/archive/refs/heads/main.zip -O a.zip`
	- `unzip a.zip`
	- `chmod +x /tmp/MT3000-main/setup.sh`
	- `/tmp/MT3000-main/setup.sh`

Yes, this work used ai but with assurance by extensive testing lol.

## AdGuardHome Modifications
AdGuardHome startup has been modified to use the ram as storage and also for app data.
However, stats will not persist.

This method uses the internet to download the latest AGH then runs it in ram.
If it fails or is offline, it uses a local copy as backup, should it have one.

I originally used both these setups (was my starting point):
- https://forum.gl-inet.com/t/does-gl-mt1300-beryl-support-adguard-home-and-gl-product-questions/14360
- https://forum.openwrt.org/t/howto-running-adguard-home-on-openwrt/51678
however, i just wanted to use the ram since it is quite enough and does not mess with the filesystem that much unlike that extroot method.

check out the `/etc/init.d/adguardhome` file for the implementation.