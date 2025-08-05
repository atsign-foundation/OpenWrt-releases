#!/bin/sh
KEYID=017dd9bf3c8f2e4a
mkdir -p /etc/opkg/keys 2>/dev/null
cat <<- PUBKEY > /etc/opkg/keys/${KEYID}
untrusted comment: Public usign key for Atsign packages
RWQBfdm/PI8uSg59n4ZV92gaoLT7KPyrULMjvWyTjzIbhUoayb8jeOrJ
PUBKEY
