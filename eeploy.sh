#! /usr/bin/env bash

if [ -z "$IDKDOCROOT" ]; then
  IDKDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot
fi

IDKDOCREPO=https://github.com/eyedeekay/eyedeekay.github.io

FFXDOCROOT=$IDKDOCROOT/I2P-in-Private-Browsing-Mode-Firefox/
FFXDOCREPO=https://github.com/eyedeekay/I2P-in-Private-Browsing-Mode-Firefox
FFXSTATROOT=$IDKDOCROOT/firefox-static/
FFXSTATREPO=https://github.com/eyedeekay/firefox-static
CHRDOCROOT=$IDKDOCROOT/I2P-Configuration-For-Chromium/
CHRDOCREPO=https://github.com/eyedeekay/I2P-Configuration-For-Chromium
FNGDOCROOT=$IDKDOCROOT/I2P-Browser-Attackability-Evaluation/
FNGDOCREPO=https://github.com/eyedeekay/I2P-Browser-Attackability-Evaluation
MIRDOCROOT=$IDKDOCROOT/mirror/
MIRDOCREPO=https://github.com/eyedeekay/mirror
BUNDOCROOT=$IDKDOCROOT/bundles/
BUNDOCREPO=https://github.com/eyedeekay/i2p.i2p.git.bundles


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
setuppage $BUNDOCROOT $BUNDOCREPO
