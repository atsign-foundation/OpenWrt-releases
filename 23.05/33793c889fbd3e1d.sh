#!/bin/sh
KEYID=33793c889fbd3e1d
mkdir -p /etc/opkg/keys 2>/dev/null
cat <<- PUBKEY > /etc/opkg/keys/${KEYID}
RWQzeTyIn70+HWGV9KuQqbJhkjUEEuzj+KQbAVJknv6Ov9EpnQ7nuCw/
PUBKEY
