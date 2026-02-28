#!/bin/sh

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Copy directories
cp -r /tmp/MT3000-main/etc/* /etc/
chmod +x /etc/init.d/adguardhome
/etc/init.d/adguardhome enable
rm -f /usr/bin/AdGuardHome

echo "Setup completed!"
echo "Rebooting in 10 Seconds..."
echo "CTRL+C to cancel."
sleep 10
reboot