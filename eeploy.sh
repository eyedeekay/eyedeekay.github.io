#! /usr/bin/env bash

if [ whoami = i2psvc ]; then
    CONFIGDOCROOT="/var/lib/i2p/i2p-config/eepsite/docroot"
else
    CONFIGDOCROOT=$HOME/.i2p/eepsite/docroot
fi

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

#BRBDOCROOT="$CONFIGDOCROOT"eepsite/docroot/brb/
#BRBDOCREPO=https://github.com/eyedeekay/brb

JPAKDOCROOT="$CONFIGDOCROOT"eepsite/docroot/i2p/
JPAKDOCREPO=https://github.com/eyedeekay/i2p

EEPDOCROOT="$CONFIGDOCROOT"eepsite/docroot/eephttpd/
EEPDOCREPO=https://github.com/eyedeekay/eephttpd

BRBDOCROOT="$CONFIGDOCROOT"eepsite/docroot/brb/
BRBDOCREPO=https://github.com/eyedeekay/brb

RAILDOCROOT="$CONFIGDOCROOT"eepsite/docroot/railroad/
RAILDOCREPO=https://github.com/eyedeekay/railroad

function setuppage(){
    DOCROOT=$1
    DOCREPO=$2
    echo "Setting personal site from $DOCREPO in $DOCROOT"
    if [ -d "$DOCROOT" ]; then
        if [ -d "$DOCROOT.git" ]; then
            cd "$DOCROOT" && pwd && git pull --all
            cd "$DOCROOT" && git submodule update --recursive --remote
        fi
    else
        git clone "$DOCREPO" "$DOCROOT"
    fi
}

setuppage $IDKDOCROOT $IDKDOCREPO
setuppage $FFXDOCROOT $FFXDOCREPO
setuppage $FFXSTATROOT $FFXSTATREPO
setuppage $CHRDOCROOT $CHRDOCREPO
setuppage $FNGDOCROOT $FNGDOCREPO
setuppage $RAILDOCROOT $RAILDOCREPO
setuppage $JPAKDOCROOT $JPAKDOCREPO
setuppage $EEPDOCROOT $EEPDOCREPO
setuppage $BRBDOCROOT $BRBDOCREPO
setuppage $MIRDOCROOT $MIRDOCREPO
