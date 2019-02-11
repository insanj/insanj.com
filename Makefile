WHITELIST=-not -name '.git' -not -name '_jekyll' -not -name '.gitignore' -not -name 'LICENSE.md' -not -name 'Makefile' -not -name 'README.md' -not -name '.gitftpignore' -not -name 'CNAME'
BUILD_PATH=_jekyll/_site/
build:
	make -C _jekyll build
	find . -maxdepth 1 -type f $(WHITELIST) -exec rm -r {} \; # files
	find . -maxdepth 1 $(WHITELIST) -exec rm -r {} \; # dirs
	find $(BUILD_PATH) -name Gemfile.lock -exec rm -r {} \;
	find $(BUILD_PATH) -name Gemfile -exec rm -r {} \;
	find $(BUILD_PATH) -name Makefile -exec rm -r {} \;
	cp -r -f $(BUILD_PATH)* .

serve:
	make -C _jekyll serve

init: # check _jekyll/Makefile for more specific dep instructions
	cd _jekyll && bundle install
