#! /usr/bin/env sh

export http_proxy=http://127.0.0.1:4444
http_proxy=http://127.0.0.1:4444

mkdir -p plugins
cd plugins

# Fetch them all, but don't be an asshole about it

wget -c http://stats.i2p/i2p/plugins/I2PControl.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/I2PControl-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/i2phex.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/i2phex-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/i2phex-windows.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/i2phex-windows-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/i2psnark-rpc.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/i2psnark-rpc-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/jwebcache.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/jwebcache-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/orchid.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/orchid-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/servlet3.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/snowman.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-linux-i386.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-linux-i386-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-linux-x86-64.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-linux-i386-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-win32.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-win32-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-win64.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-win32-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-mac64.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-linux-i386-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/zzzot.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/zzzot-update.su3 ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/desktopgui.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/desktopgui-update.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/jIRCii.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/jIRCii-update.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/pebble.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/pebble-update.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/servlet3.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/snowman.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-mac32.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/syndie-linux-i386-update.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/tahoe-lafs-controller.xpi2p ; sleep 2m
wget -c http://stats.i2p/i2p/plugins/tahoe-lafs-controller-update.xpi2p ; sleep 2m
