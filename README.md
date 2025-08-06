<a href="https://atsign.com#gh-light-mode-only"><img width=250px src="https://atsign.com/wp-content/uploads/2022/05/atsign-logo-horizontal-color2022.svg#gh-light-mode-only" alt="The Atsign Foundation"></a><a href="https://atsign.com#gh-dark-mode-only"><img width=250px src="https://atsign.com/wp-content/uploads/2023/08/atsign-logo-horizontal-reverse2022-Color.svg#gh-dark-mode-only" alt="The Atsign Foundation"></a>

# Atsign OpenWrt packages

Welcome to the Atsign OpenWrt packages download repo.

## Releases website

[Releases](https://atsign-foundation.github.io/OpenWrt-releases/)

## Why only versions 23.05 and 24.10?

23.05 and 24.10 are the presently supported stable branches of OpenWrt.

From the
[OpenWrt version history](https://openwrt.org/about/history#openwrt_2203):

> OpenWrt 22.03 has been declared End-of-Support in July 2024 and is
no longer maintained or actively supported.

### Why no apk packages for SNAPSHOT?

SNAPSHOT is excluded here as NoPorts (`csshnpd` and `luci-app-csshnpd`) is
available in upstream SNAPSHOT releases.

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

#### With LuCI

* Browse to System > Software
* Type `cssh` into the Filter: box
* Click `Install...` for the `luci-app-csshnpd` package
* Click `Install` on the Details pop up.
* Then `Dismiss` once the Executing package manager popup has completed
(it should end with `Configuring luci-app-csshnpd.`)

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
