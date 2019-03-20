
build: config-remote
	bundle exec jekyll build 

serve: config-local
	bundle exec jekyll serve --watch

BASE_CONFIG=_config_base.yml	
CONFIG=_config.yml	
config:
	rm -r -f $(CONFIG)
	cp -rf $(BASE_CONFIG) $(CONFIG)

SITE_FLAG=julian-site: 
BUILD_SITE=http://localhost:4000/
config-local: config 
	echo "$(SITE_FLAG)$(BUILD_SITE)" >> $(CONFIG)

REMOTE_SITE=https://insanj.com/	
config-remote: config
		echo "$(SITE_FLAG)$(REMOTE_SITE)" >> $(CONFIG)

SITE_DIR=_site
open:
	python -m webbrowser "http://localhost:4000"
	cd $(SITE_DIR) && python -m SimpleHTTPServer 4000

deps:
	gem install jekyll bundler jekyll-paginate
	bundle install
	
windows-deps: # steps that may be required in a new Ubuntu environment
	sudo apt-get update
	sudo apt-get install ruby-full
	sudo apt install gcc
	sudo apt install g++
	sudo apt-get install zlib1g-dev
	sudo apt install python
	make windows-deps-gems
	sudo apt install xterm

windows-deps-gems:
	sudo gem install jekyll
	sudo gem install bundler
	sudo gem install nokogiri # this frequently fails if not run manually
	bundle install
	# these should be install with bundler, but if not...
	# sudo gem install jekyll-paginate
	# sudo gem install jekyll-sitemap
	# sudo gem install jemoji
