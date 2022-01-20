#! /usr/bin/env bash

if [ `whoami` = i2psvc ]; then
    CONFIGDOCROOT="/var/lib/i2p/i2p-config/"
else
    CONFIGDOCROOT=$HOME/.i2p/
fi

#Don't forget the trailing slash on all directories or the site will not update.
IDKDOCROOT="$CONFIGDOCROOT"eepsite/docroot/
IDKDOCREPO=https://github.com/eyedeekay/eyedeekay.github.io

FFXDOCROOT="$CONFIGDOCROOT"eepsite/docroot/I2P-in-Private-Browsing-Mode-Firefox/
FFXDOCREPO=https://github.com/eyedeekay/I2P-in-Private-Browsing-Mode-Firefox
FFXSTATROOT="$CONFIGDOCROOT"eepsite/docroot/firefox-static/
FFXSTATREPO=https://github.com/eyedeekay/firefox-static
CHRDOCROOT="$CONFIGDOCROOT"eepsite/docroot/I2P-Configuration-For-Chromium/
CHRDOCREPO=https://github.com/eyedeekay/I2P-Configuration-For-Chromium
FNGDOCROOT="$CONFIGDOCROOT"eepsite/docroot/I2P-Browser-Attackability-Evaluation/
FNGDOCREPO=https://github.com/eyedeekay/I2P-Browser-Attackability-Evaluation
MIRDOCROOT="$CONFIGDOCROOT"eepsite/docroot/mirror/
MIRDOCREPO=https://github.com/eyedeekay/mirror

JAVADOCROOT="$CONFIGDOCROOT"eepsite/docroot/javadoc-i2p/
JAVADOCREPO=https://github.com/eyedeekay/javadoc-i2p

BRBDOCROOT="$CONFIGDOCROOT"eepsite/docroot/brb/
BRBDOCREPO=https://github.com/eyedeekay/brb

MTGDOCROOT="$CONFIGDOCROOT"eepsite/docroot/mtg-i2p/
MTGDOCREPO=https://github.com/eyedeekay/mtg-i2p

JPAKDOCROOT="$CONFIGDOCROOT"eepsite/docroot/i2p/
JPAKDOCREPO=https://github.com/eyedeekay/i2p

EEPDOCROOT="$CONFIGDOCROOT"eepsite/docroot/eephttpd/
EEPDOCREPO=https://github.com/eyedeekay/eephttpd

BRBDOCROOT="$CONFIGDOCROOT"eepsite/docroot/brb/
BRBDOCREPO=https://github.com/eyedeekay/brb

IRCDOCROOT="$CONFIGDOCROOT"eepsite/docroot/terrarium/
IRCDOCREPO=https://github.com/eyedeekay/terrarium

RAILDOCROOT="$CONFIGDOCROOT"eepsite/docroot/railroad/
RAILDOCREPO=https://github.com/eyedeekay/railroad

RESEEDDOCROOT="$CONFIGDOCROOT"eepsite/docroot/reseed-tools/
RESEEDDOCREPO=https://github.com/eyedeekay/reseed-tools

DOKUDOCROOT="$CONFIGDOCROOT"eepsite/docroot/Dokuwiki-over-I2P/
DOKUDOCREPO=https://github.com/eyedeekay/Dokuwiki-over-I2P

NEXTDOCROOT="$CONFIGDOCROOT"eepsite/docroot/Nextcloud-over-I2P-on-Docker/
NEXTDOCREPO=https://github.com/eyedeekay/Nextcloud-over-I2P-on-Docker

SSHDOCROOT="$CONFIGDOCROOT"eepsite/docroot/i2p-i2pd-sshsetup/
SSHDOCREPO=https://github.com/eyedeekay/i2p-i2pd-sshsetup

BLIZZARDDOCROOT="$CONFIGDOCROOT"eepsite/docroot/blizzard/
BLIZZARDDOCREPO=https://github.com/eyedeekay/blizzard

WESNOTHDOCROOT="$CONFIGDOCROOT"eepsite/docroot/battle-for-wesnoth-i2p/
WESNOTHDOCREPO=https://github.com/eyedeekay/battle-for-wesnoth-i2p

NETHACKDOCROOT="$CONFIGDOCROOT"eepsite/docroot/nethack-i2p/
NETHACKDOCREPO=https://github.com/eyedeekay/nethack-i2p

THUNDERBIRDDOCROOT="$CONFIGDOCROOT"eepsite/docroot/Thunderbird-I2P-Auto-Configuration/
THUNDERBIRDDOCREPO=https://github.com/eyedeekay/Thunderbird-I2P-Auto-Configuration

DUNGEONQUESTDOCROOT="$CONFIGDOCROOT"eepsite/docroot/dungeonQuest/
DUNGEONQUESTDOCREPO=https://github.com/eyedeekay/dungeonQuest

DEBDOCROOT="$CONFIGDOCROOT"eepsite/docroot/apt/
DEBDOCREPO=https://github.com/eyedeekay/apt

FDROIDDOCROOT="$CONFIGDOCROOT"eepsite/docroot/fdroid/
FDROIDDOCREPO=https://github.com/eyedeekay/fdroid

FDROIDDEVDOCROOT="$CONFIGDOCROOT"eepsite/docroot/fdroid-dev/
FDROIDDEVDOCREPO=https://github.com/eyedeekay/fdroid-dev

function setuppage(){
    DOCROOT=$1
    DOCREPO=$2
    echo "Setting personal site from $DOCREPO in $DOCROOT"
    if [ -d "$DOCROOT" ]; then
        if [ -d "$DOCROOT.git" ]; then
            cd "$DOCROOT" && pwd && git pull --ff-only --all
            cd "$DOCROOT" && git submodule update --recursive --remote
        fi
    else
        git clone "$DOCREPO" "$DOCROOT"
    fi
}

function pluginsetup(){
    DOCROOT=$1
    DOCREPO=$2
    echo "Setting personal site from $DOCREPO in $DOCROOT"
    if [ -d "$DOCROOT" ]; then
        if [ -d "$DOCROOT.git" ]; then
            cd "$DOCROOT" && pwd && git pull --ff-only --all
            cd "$DOCROOT" && git submodule update --recursive --remote
        fi
    else
        git clone "$DOCREPO" "$DOCROOT"
    fi
    cd "$DOCROOT"
    make download-su3s
}

pluginsetup $RAILDOCROOT $RAILDOCREPO
pluginsetup $BLIZZARDDOCROOT $BLIZZARDDOCREPO
pluginsetup $MTGDOCROOT $MTGDOCREPO
pluginsetup $THUNDERBIRDDOCROOT $THUNDERBIRDDOCREPO
pluginsetup $DUNGEONQUESTDOCROOT $DUNGEONQUESTDOCREPO
setuppage $NETHACKDOCROOT $NETHACKDOCREPO
setuppage $WESNOTHDOCROOT $WESNOTHDOCREPO
setuppage $IDKDOCROOT $IDKDOCREPO
setuppage $FFXDOCROOT $FFXDOCREPO
setuppage $FFXSTATROOT $FFXSTATREPO
setuppage $CHRDOCROOT $CHRDOCREPO
setuppage $FNGDOCROOT $FNGDOCREPO
setuppage $JPAKDOCROOT $JPAKDOCREPO
setuppage $EEPDOCROOT $EEPDOCREPO
setuppage $BRBDOCROOT $BRBDOCREPO
pluginsetup $MIRDOCROOT $MIRDOCREPO
setuppage $DOKUDOCROOT $DOKUDOCREPO
setuppage $NEXTDOCROOT $NEXTDOCREPO
setuppage $SSHDOCROOT $SSHDOCREPO
setuppage $JAVADOCROOT $JAVADOCREPO
setuppage $FDROIDDOCROOT $FDROIDDOCREPO
setuppage $DEBDOCROOT $DEBDOCREPO
setuppage $FDROIDDEVDOCROOT $FDROIDDEVDOCREPO
pluginsetup $RESEEDDOCROOT $RESEEDDOCREPO
pluginsetup $IRCDOCROOT $IRCDOCREPO
