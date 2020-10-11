#! /usr/bin/env bash
rm -rfv ~/.i2p/i2psnark/idk.i2p ~/.i2p/i2psnark/idk.i2p.torrent ~/.i2p/i2psnark/idk.i2p.zip
wget -O ~/.i2p/i2psnark/idk.i2p.torrent https://eyedeekay.github.io/idk.i2p.torrent
wget -O ~/.i2p/i2psnark/idk.i2p.zip https://github.com/eyedeekay/eyedeekay.github.io/archive/master.zip
unzip ~/.i2p/i2psnark/idk.i2p.zip -d ~/.i2p/i2psnark/
mv ~/.i2p/i2psnark/eyedeekay.github.io-master ~/.i2p/i2psnark/idk.i2p
