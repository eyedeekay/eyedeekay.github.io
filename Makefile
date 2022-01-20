
dummy:
	@echo 'type make all then make index then push to ghp'

all: clean index torrent up 

clean:
	rm -rf idk.i2p .torrent idk.i2p.torrent ~/.i2p/i2psnark/idk.i2p ~/.i2p/i2psnark/idk.i2p.torrent tmp
	mkdir -p idk.i2p

DATE=`date +%Y%m%d`

torrent:
	#cp -v *.* idk.i2p; true; \
		#cp -rv images idk.i2p/images; \
		#cp -rv video idk.i2p/video; \
		#cp -rv plugins idk.i2p/plugins && \
		#rm -f idk.i2p/idk.i2p.torrent idk.i2p/idk.i2p.zip
	rm -rf idk.i2p
	#cp -r . ../idk.i2p.tmp
	rsync --cvs-exclude -rav . ../idk.i2p.tmp
	find ../idk.i2p -type d -name '.git' -exec rm -rf {} \; ; true
	find ../idk.i2p -type d -name '*.crl' -exec rm -rf {} \; ; true
	find ../idk.i2p -type d -name '*.crt' -exec rm -rf {} \; ; true
	find ../idk.i2p -type d -name '*.pem' -exec rm -rf {} \; ; true
	find ../idk.i2p -type d -exec rm -rf {}/.??* \; ; true 
	mv ../idk.i2p.tmp idk.i2p
	mktorrent -a 'http://w7tpbzncbcocrqtwwm3nezhnnsw4ozadvi2hmvzdhrqzfxfum7wa.b32.i2p/a' \
		-a 'http://uajd4nctepxpac4c4bdyrdw7qvja2a5u3x25otfhkptcjgd53ioq.b32.i2p/announce' \
		-a 'http://s5ikrdyjwbcgxmqetxb3nyheizftms7euacuub2hic7defkh3xhq.b32.i2p/a' \
		-a 'http://432m3mpxomy2bqccjmjru7gfeicockx7un5eni5i5uqxgakcvq6a.b32.i2p/a' \
		-a 'http://niat6zw3p5wl473256bottv3kaybodhum2omlt3bl42oiirwf5xa.b32.i2p/a' \
		-n 'idk.i2p' -w 'http://idk.i2p' -w 'http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p' -o idk.i2p_$(DATE).torrent idk.i2p
	cp idk.i2p_$(DATE).torrent idk.i2p.torrent
	rm -rf ~/.i2p/i2psnark/idk.i2p ~/.i2p/i2psnark/idk.i2p.torrent

seed: index curl upload

curl:
	@echo "#! /usr/bin/env bash" | tee curl.sh
	@echo "rm -rfv ~/.i2p/i2psnark/idk.i2p ~/.i2p/i2psnark/idk.i2p.torrent ~/.i2p/i2psnark/idk.i2p.zip" | tee -a curl.sh
	@echo "wget -O ~/.i2p/i2psnark/idk.i2p.zip https://github.com/eyedeekay/eyedeekay.github.io/releases/download/current/idk.i2p.zip" | tee -a curl.sh
	@echo "wget -O ~/.i2p/i2psnark/idk.i2p.torrent https://eyedeekay.github.io/idk.i2p.torrent" | tee -a curl.sh
	#@echo "wget -O ~/.i2p/i2psnark/idk.i2p.zip https://github.com/eyedeekay/eyedeekay.github.io/releases/download/`rhash -g idk.i2p.torrent | sed 's|magnet:?xt=urn:btih:||g'`.magnet/idk.i2p.zip" | tee -a curl.sh
	@echo "unzip ~/.i2p/i2psnark/idk.i2p.zip -d ~/.i2p/i2psnark/" | tee -a curl.sh
	#@echo "mv ~/.i2p/i2psnark/eyedeekay.github.io-master ~/.i2p/i2psnark/idk.i2p" | tee -a curl.sh
	zip -r idk.i2p.zip idk.i2p

upload: upload-release upload-torrent upload-zip

upload-release:
	#gothub release -p -u eyedeekay -r eyedeekay.github.io -t `rhash -g idk.i2p.torrent | sed 's|magnet:?xt=urn:btih:||g'`.magnet -n "`rhash -g idk.i2p.torrent | sed 's|magnet:?xt=urn:btih:||g'`".magnet -d "Site snapshot as of `date`"

upload-torrent:
	#gothub upload -R -u eyedeekay -r eyedeekay.github.io -t `rhash -g idk.i2p.torrent | sed 's|magnet:?xt=urn:btih:||g'`.magnet -n idk.i2p.torrent -f idk.i2p.torrent

upload-zip:
	#gothub -v upload -R -u eyedeekay -r eyedeekay.github.io -t `rhash -g idk.i2p.torrent | sed 's|magnet:?xt=urn:btih:||g'`.magnet -n idk.i2p.zip -f idk.i2p.zip

current: current-release current-torrent current-zip

current-release:
	#gothub release -p -u eyedeekay -r eyedeekay.github.io -t "current" -n "current" -d "Site snapshot as of `date`"; true
	#gothub edit -p -u eyedeekay -r eyedeekay.github.io -t "current" -n "current" -d "Site snapshot as of `date`"; true

current-torrent:
	#gothub upload -R -u eyedeekay -r eyedeekay.github.io -t "current" -n idk.i2p.torrent -f idk.i2p.torrent

current-zip:
	#gothub -v upload -R -u eyedeekay -r eyedeekay.github.io -t "current" -n idk.i2p.zip -f idk.i2p.zip

up:
	cp idk.i2p.torrent ~/.i2p/i2psnark/idk.i2p.torrent
	cp -rv ./idk.i2p ~/.i2p/i2psnark/idk.i2p

README:
	cat yTop.md ySidebar.md zBlog.md | tee README.md

plug:
	@echo "<!DOCTYPE html>" > plugins.html
	@echo "<html>" >> plugins.html
	@echo "<head>" >> plugins.html
	@echo "  <title>idk's home page</title>" >> plugins.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> plugins.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> plugins.html
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`rhash -g idk.i2p.torrent`"\"/>" >> plugins.html
	@echo "  <meta name=\"description\" content=\"Plugins collection\"/>" >> plugins.html
	@echo "</head>" >> plugins.html
	@echo "<body>" >> plugins.html
	sed "s|magnetsub|[Magnet Link]($(magnet))|g" plugins.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | \
		markdown | tee -a plugins.html
	@echo "  <script src=\"script.js\" type=\"text/javascript\"></script>" >> plugins.html
	@echo "</body>" >> plugins.html
	@echo "</html>" >> plugins.html

info:
	@echo "<!DOCTYPE html>" > infographics.html
	@echo "<html>" >> infographics.html
	@echo "<head>" >> infographics.html
	@echo "  <title>idk's home page</title>" >> infographics.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> infographics.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> infographics.html
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`rhash -g idk.i2p.torrent`"\"/>" >> infographics.html
	@echo "  <meta name=\"description\" content=\"Infographics collection\"/>" >> infographics.html
	@echo "</head>" >> infographics.html
	@echo "<body>" >> infographics.html
	sed "s|magnetsub|[Magnet Link]($(magnet))|g" infographics.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | \
		markdown | tee -a infographics.html
	@echo "  <script src=\"script.js\" type=\"text/javascript\"></script>" >> infographics.html
	@echo "</body>" >> infographics.html
	@echo "</html>" >> infographics.html

vid:
	@echo "<!DOCTYPE html>" > video.html
	@echo "<html>" >> video.html
	@echo "<head>" >> video.html
	@echo "  <title>idk's home page</title>" >> video.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> video.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> video.html
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`rhash -g idk.i2p.torrent`"\"/>" >> video.html
	@echo "  <meta name=\"description\" content=\"I2P Videos\"/>" >> video.html
	@echo "</head>" >> video.html
	@echo "<body>" >> video.html
	sed "s|magnetsub|[Magnet Link]($(magnet))|g" videos.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | \
		markdown | tee -a video.html
	@echo "<ul><li>" >> video.html
	./videotag.sh video/torontotalk.webm >> video.html
	@echo "</li><li>" >> video.html
	./videotag.sh video/monerotalk.mp4 >> video.html
	@echo "</li></ul>" >> video.html
	@echo "  <script src=\"script.js\" type=\"text/javascript\"></script>" >> video.html
	@echo "</body>" >> video.html
	@echo "</html>" >> video.html


mag:
	@echo `rhash -g idk.i2p.torrent`
	@echo `rhash -g idk.i2p.torrent | sed 's|magnet:?xt=urn:btih:||g'`

index: README info vid plug curl
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html>" >> index.html
	@echo "<head>" >> index.html
	@echo "  <title>idk's home page</title>" >> index.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> index.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> index.html
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`rhash -g idk.i2p.torrent`"\"/>" >> index.html
	@echo "  <meta name=\"description\" content=\"idk's I2P software and information\"/>" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	sed "s|magnetsub|[Magnet Link]($(magnet))|g" README.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | \
		markdown | tee -a index.html
	@echo "  <script src=\"script.js\" type=\"text/javascript\"></script>" >> index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html

update:
	make all && make seed && git commit -am "`date`" && git push --all