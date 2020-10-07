idk's home page
===============

I like to make peer-to-peer things, and think we should structure the future in
a way which builds in privacy by default in a maximally peer-to-peer way.

Projects:
---------

Besides working on [I2P](https://geti2p.net/), I have a bunch of side-projects
centered around the use of I2P, especially in Go and Javascript. Some of these
are also I2P labs projects.

### I2P Webextensions and Browser Research

 * [I2P in Private Browsing Mode for Firefox](I2P-in-Private-Browsing-Mode-Firefox/)
 inspired by Brave, this browser extension enforces a few privacy rules for
 Firefox, then implements a set of "Container Tabs" which can be used to browse
 I2P in a way which is automatic and safe.
 * [I2P Configuration Helper for Chromium](I2P-Configuration-For-Chromium/)
 A fork of the Firefox plugin before it used container tabs, after the user sets
 up an I2P browsing profile this plugin can automatically set up the profile to
 use I2P with the maximum privacy available from Chromium.
 * [I2P Browser Fingerprint Gallery](I2P-Browser-Attackability-Evaluation/)
 This is an ongoing evaluation of the various ways there are to configure
 browsers for I2P and a developing rating system for them.
 * [InfoGraphic Gallery for testing X-I2P-TorrentLocation](infographics.html)

### Go(golang) I2P Tools

 * [samcatd](https://github.com/eyedeekay/sam-forwarder) a.k.a. sam-forwarder
 many of the other applications use sam-forwarder as a way of automatically
 configuring i2ptunnels, including:
  - [httptunnel](https://github.com/eyedeekay/httptunnel) is a standalone http
  proxy for I2P that uses SAM and implements an interface like sam-forwarder.
  - [eephttpd](https://github.com/eyedeekay/eephttpd) is a simple static http
  server with markdown parsing support.
  - [gitsam](https://github.com/eyedeekay/gitsam) is a super-simple git
  repository setup built on eephttpd and [gitkit]().
  - [reposam](https://github.com/eyedeekay/reposam) is a binary deb repository
  built on [repogen]().
  - [samtracker](https://github.com/eyedeekay/samtracker) is a simple torrent
  tracker built upon [retracker]().
  - [cowyosam](https://github.com/eyedeekay/cowyosam) is a pastebin-wiki hybrid
  built on [cowyo]()
  - [colluding_sites_attack](https://github.com/eyedeekay/colluding_sites_attack)
  is a tool for fingerprinting browsers as they visit eepSites to determine if
  useful information can be extracted.
  - [outproxy](https://github.com/eyedeekay/outproxy) is a standalone outproxy
  built on SAM. Definitely don't use it if you don't know what you're in for.
  - [libanonvpn](https://github.com/RTradeLtd/libanonvpn) is a VPN library and
  terminal application that uses SAM Datagrams. Sort of like onioncat, but
  cooler.
 * [checki2cp](https://github.com/eyedeekay/checki2cp) is an I2P router presence
 detection tool. Use it to find out if an I2P router is installed.
 * [goSam](https://github.com/eyedeekay/goSam) is a SAM library for Go that
 implements an HTTP Transport.
 * [i2pdig](https://github.com/eyedeekay/i2pdig) is dig, but for I2P. It's been
 a while, I'll update it soon.
 * [iget](https://github.com/eyedeekay/iget) iget is an eepget clone, with some
 extra features and room to grow.
 * [keyto](https://github.com/eyedeekay/keyto) is a text key conversion tool.
 * [sam3](https://github.com/eyedeekay/sam3) is another SAM library for Go, but
 it implements a net.Conn and net.Packetconn making it a near drop-in
 replacement for regular connections.

Blog:
-----

#### Sun Nov 26 03:21:12 EST 2017

Hi. This is the blog where I'm going to document all the wierd stuff I do on my
home network. I'm most passionate about the areas where I am relatively free of
constraints, and for me, that is in hobby computing in my own home. But since
it's not a place with an IT staff and other organizational resources, I
sometimes do wierd, ill-advised things to get my computers just the way I like
them.

Also I'm pretty bad at blogging.

#### Mon Jan 22 12:41:21 EST 2018

Getting nervous, about to flash an up-to-date coreboot port to my netbook via
a ch341a flasher. I'm about 99% sure I'm not going to hurt anything, but who
knows?

#### Tue Mar 31, 15:04:40 EST 2020

See, I told you I was pretty bad at blogging. Over 2 years. Lots of code though.
