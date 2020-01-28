#! /usr/bin/env bash

DOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/
DOCREPO=https://github.com/eyedeekay/eyedeekay.github.io

FFXDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/I2P-in-Private-Browsing-Mode-Firefox
FFXDOCREPO=https://github.com/eyedeekay/I2P-in-Private-Browsing-Mode-Firefox
CHRDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/I2P-Configuration-For-Chromium
CHRDOCREPO=https://github.com/eyedeekay/I2P-Configuration-For-Chromium
FNGDOCROOT=/var/lib/i2p/i2p-config/eepsite/docroot/I2P-Browser-Attackability-Evaluation
FNGDOCREPO=https://github.com/eyedeekay/I2P-Browser-Attackability-Evaluation

function setuppage(){
    DOCROOT=$1
    DOCREPO=$2
    echo "Setting personal site from $DOCREPO in $DOCROOT"
    if [ -d "$DOCROOT" ]; then
        if [ -d "$DOCROOT.git" ]; then
            cd "$DOCROOT" && git pull
        else
            git clone "$DOCREPO" "$DOCROOT"
        fi
    fi
}

setuppage $DOCROOT $DOCREPO
setuppage $FFXDOCROOT $FFXDOCREPO
setuppage $CHRDOCROOT $CHRDOCREPO
setuppage $FNGDOCROOT $FNGDOCREPO
