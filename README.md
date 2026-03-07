# MT3000
My personal modifications for the **GL.iNet Beryl AX (GL-MT3000) Travel Router**.

> Note: Parts of this project were initially generated with AI assistance but were validated through extensive testing. Uses the manufacturer official files extracted from the router images as the starting point.

## Quick Setup
Run the following commands on the router:

```bash
cd /tmp
wget https://github.com/lnxsnw/MT3000/archive/refs/heads/main.zip -O a.zip
unzip a.zip
chmod +x /tmp/MT3000-main/setup.sh
/tmp/MT3000-main/setup.sh
```
An internet connection is **required** for first run.

## Modifications

### AdGuardHome
- GL-MT3000 uses the arm64 variant.
- Runs **AdGuardHome entirely in RAM**.
> This approach avoids filesystem wear and avoids the complexity of **extroot setups** found in:
> -   [https://forum.gl-inet.com/t/does-gl-mt1300-beryl-support-adguard-home-and-gl-product-questions/14360](https://forum.gl-inet.com/t/does-gl-mt1300-beryl-support-adguard-home-and-gl-product-questions/14360)
> -   [https://forum.openwrt.org/t/howto-running-adguard-home-on-openwrt/51678](https://forum.openwrt.org/t/howto-running-adguard-home-on-openwrt/51678)
- The app archive (AdGuardHome_linux_arm64.tar.gz) is stored in persistent disk, but is subsequently extracted to and executed all in RAM. These files are really compressed and never exceed 15MB.
- **Stats DO NOT persist** after reboot. These are stored for 24hrs by default and is stored in RAM.
- AdGuardHome is updated by updating the app archive stored in the persistent disk. This update runs once on every device boot.
- Includes an offline blocklist (HaGeZi Pro Plus Mini) as fallback and offline use
- Uses [Quad9's DNSCrypt Protocol](https://github.com/Quad9DNS/dnscrypt-settings). 3 IPv4 Anycast dnssec/no-log/filter upstreams are used.
- IPv6 resolving and support is disabled.
- Blocked replies uses NXDOMAIN responses.
- Some user_rules are added for Google Device Location Tracking, YouTube, Canva, Instagram, Facebook, and Discord. You may remove/modify these at the ui or however you want.
- Using Ubiquiti's WiFiman will not record dns calls using that app, but will still resolve queries.