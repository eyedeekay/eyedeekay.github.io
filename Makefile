
dummy:

README:
	cat yTop.md ySidebar.md zBlog.md | tee README.md

index: README
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html>" >> index.html
	@echo "<head>" >> index.html
	@echo "  <title>I2P Browser Configurations and their Attackability</title>" >> index.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	sed "s|magnetsub|[Magnet Link]($(MAGNET))|g" README.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | markdown | tee -a index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html