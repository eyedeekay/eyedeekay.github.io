
dummy:
	@echo 'type make all then make index then push to ghp'

all: clean index torrent up 

clean:
	rm -rf idk.i2p .torrent idk.i2p.torrent ~/.i2p/i2psnark/idk.i2p ~/.i2p/i2psnark/idk.i2p.torrent tmp
	mkdir -p idk.i2p

torrent:
	cp -v *.* idk.i2p; true; cp -rv images idk.i2p/images; cp -rv video idk.i2p/video
	mktorrent -a 'http://g6r5tkh4b6psuxm42kzgmddclbha4cs667wumuqbuzhesu2phy4a.b32.i2p/a' -n 'idk.i2p' -w 'http://idk.i2p' -w 'http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p' -o idk.i2p.torrent idk.i2p
	rm -rf ~/.i2p/i2psnark/idk.i2p

up:
	cp idk.i2p.torrent ~/.i2p/i2psnark/idk.i2p.torrent
	cp -rv ./idk.i2p ~/.i2p/i2psnark/idk.i2p

README:
	cat yTop.md ySidebar.md zBlog.md | tee README.md

info:
	@echo "<!DOCTYPE html>" > infographics.html
	@echo "<html>" >> infographics.html
	@echo "<head>" >> infographics.html
	@echo "  <title>idk's home page</title>" >> infographics.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> infographics.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> infographics.html
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`torrent2magnet idk.i2p.torrent`"\"/>" >> infographics.html
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
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`torrent2magnet idk.i2p.torrent`"\"/>" >> video.html
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
	@echo `torrent2magnet idk.i2p.torrent`

index: README info vid
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html>" >> index.html
	@echo "<head>" >> index.html
	@echo "  <title>idk's home page</title>" >> index.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> index.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> index.html
	@echo "  <meta http-equiv=\"i2p-torrentlocation\" content=\""`torrent2magnet idk.i2p.torrent`"\"/>" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	sed "s|magnetsub|[Magnet Link]($(magnet))|g" README.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | \
		markdown | tee -a index.html
	@echo "  <script src=\"script.js\" type=\"text/javascript\"></script>" >> index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html

