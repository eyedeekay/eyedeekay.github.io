
dummy:

README:
	cat yTop.md ySidebar.md zBlog.md | tee README.md

index: README
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html>" >> index.html
	@echo "<head>" >> index.html
	@echo "  <title>idk's home page</title>" >> index.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"style.css\" />" >> index.html
	@echo "  <meta http-equiv=\"i2p-location\" content=\"http://b2o47zwxqjbn7jj37yqkmvbmci7kqubwgxu3umqid7cexmc7xudq.b32.i2p\"/>" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	sed "s|magnetsub|[Magnet Link]($(MAGNET))|g" README.md | \
		sed 's|https://github.com/eyedeekay/various-i2p-browsers/tree/master||g' | \
		markdown | tee -a index.html
	@echo "  <script src=\"script.js\" type=\"text/javascript\"></script>" >> index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html

