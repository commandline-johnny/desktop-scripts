#!/usr/bin/env bash

# Toggle VPN state

### Add your VPN connection name as it appears in Network Manager, for example
### "Proton Switzerland"

export VPN_NAME=""
export NMCLI="/usr/bin/nmcli"

# Check if our connection is active. If it is, down it. If it isn't active,
# up it.
if $NMCLI c show --active |grep vpn|grep "$VPN_NAME"
then
    $NMCLI c down "$VPN_NAME" 2>&1 > /dev/null
else
    $NMCLI c up "$VPN_NAME" 2>&1 > /dev/null
fi
