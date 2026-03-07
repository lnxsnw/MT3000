#!/bin/sh

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# ACTION
cp -r /tmp/MT3000-main/etc/* /etc/
chmod +x /etc/init.d/adguardhome
rm -f /usr/bin/AdGuardHome

# END
echo "Setup completed!"
echo "Restart router? (Y/N)"
echo "This script will restart the router in 5 seconds when no user input is detected..."

if read -r -t 5 -n 1 answer; then
    case "$answer" in
        [Yy])
            echo
            echo "Restarting..."
            reboot
            ;;
        [Nn])
            echo
            echo "Restart cancelled."
            ;;
        *)
            echo
            echo "Invalid input. Restart cancelled."
            ;;
    esac
else
    echo
    echo "No input detected. Restarting..."
    reboot
fi
