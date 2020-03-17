#! /usr/bin/env bash

IDKDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/
IDKDOCREPO=https://github.com/eyedeekay/eyedeekay.github.io

FFXDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/I2P-in-Private-Browsing-Mode-Firefox/
FFXDOCREPO=https://github.com/eyedeekay/I2P-in-Private-Browsing-Mode-Firefox
FFXSTATROOT=/var/lib/i2p/i2p-config/eepsite/docroot/firefox-static/
FFXSTATREPO=https://github.com/eyedeekay/firefox-static
CHRDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/I2P-Configuration-For-Chromium/
CHRDOCREPO=https://github.com/eyedeekay/I2P-Configuration-For-Chromium
FNGDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/I2P-Browser-Attackability-Evaluation/
FNGDOCREPO=https://github.com/eyedeekay/I2P-Browser-Attackability-Evaluation
MIRDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/mirror/
MIRDOCREPO=https://github.com/eyedeekay/mirror


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
setuppage $MIRDOCROOT $MIRDOCREPO