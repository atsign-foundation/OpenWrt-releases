# Atsign OpenWrt packages

Welcome to the Atsign OpenWrt packages download repo.

## Releases website

[Releases](https://atsign-foundation.github.io/OpenWrt-releases/)

## How to use on OpenWrt

### Install key and feeds

#### Add Atsign's usign public key to opkg

* Download `https://atsign-foundation.github.io/OpenWrt-releases/24.10/017dd9bf3c8f2e4a.pub`
* Put it into `/etc/opkg/keys/017dd9bf3c8f2e4a`, note filename must be lowercase

e.g.

```sh
cd /etc/opkg/keys
wget https://atsign-foundation.github.io/OpenWrt-releases/24.10/017dd9bf3c8f2e4a.pub -O 017dd9bf3c8f2e4a
```

#### Add the Atsign package feeds to `/etc/opkg/customfeeds.conf`

Open `/etc/opkg/customfeeds.conf` in your preferred editor and append the
following to the end of the file:

```ini
src/gz atsign_packages_luci https://atsign-foundation.github.io/OpenWrt-releases/<major.minor version>/packages/<package arch>/luci
src/gz atsign_packages_packages https://atsign-foundation.github.io/OpenWrt-releases/<major.minor version>/packages/<package arch>/packages
```

NB. The file can also be edited in LuCI by browsing to System > Software.
Then clicking on the `Configure opkg` button.

e.g. for the 24.10 releases on x86_64:

```ini
# add your custom package feeds here
#
# src/gz example_feed_name http://www.example.com/path/to/files
src/gz atsign_packages_luci https://atsign-foundation.github.io/OpenWrt-releases/24.10/packages/x86_64/luci
src/gz atsign_packages_packages https://atsign-foundation.github.io/OpenWrt-releases/24.10/packages/x86_64/packages
```

#### `opkg update`

Once the key and feeds are in place run `opkg update` (or click the
`Update lists...` button in the System > Software page on LuCI).

### Installing NoPorts

#### With LuCI web configuration

* Browse to System > Software
* Type `cssh` into the Filter: box
* Click `Install...` for the `luci-app-csshnpd` package

NB. installing `luci-app-csshnpd` will also install `csshnpd` as a dependency.

Log out of LuCI then sign back in again to get NoPorts on the Network dropdown.

#### Command line installation

`opkg install luci-app-csshnpd` if you want the LuCI app

or

`opkg install csshnpd` if you just want the daemon and you're happy to do
configuration using a text editor, and enrollment using the `at_enroll.sh`
script.

## Acknowledgements

Thanks to the [Fantastic Packages](https://github.com/fantastic-packages/)
team for providing the mechanism that's been forked to create this, and to
[@systemcrash](https://github.com/systemcrash) for the
[suggestion](https://github.com/openwrt/luci/pull/7832#issuecomment-3033002519)
