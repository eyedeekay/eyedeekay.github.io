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

BRBDOCROOT="$CONFIGDOCROOT"eepsite/docroot/brb/
BRBDOCREPO=https://github.com/eyedeekay/brb

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

setuppage $IDKDOCROOT $IDKDOCREPO
setuppage $FFXDOCROOT $FFXDOCREPO
setuppage $FFXSTATROOT $FFXSTATREPO
setuppage $CHRDOCROOT $CHRDOCREPO
setuppage $FNGDOCROOT $FNGDOCREPO
pluginsetup $RAILDOCROOT $RAILDOCREPO
setuppage $JPAKDOCROOT $JPAKDOCREPO
setuppage $EEPDOCROOT $EEPDOCREPO
setuppage $BRBDOCROOT $BRBDOCREPO
setuppage $MIRDOCROOT $MIRDOCREPO
setuppage $DOKUDOCROOT $DOKUDOCREPO
setuppage $NEXTDOCROOT $NEXTDOCREPO
setuppage $SSHDOCROOT $SSHDOCREPO
pluginsetup $RESEEDDOCROOT $RESEEDDOCREPO
pluginsetup $BLIZZARDDOCROOT $BLIZZARDDOCREPO
pluginsetup $IRCDOCROOT $IRCDOCREPO