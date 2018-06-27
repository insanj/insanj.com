LOCAL_CONFIG=_local_config.yml
REMOTE_CONFIG=_remote_config.yml
CONFIG=_config.yml
SITE_DIR=_site

default: config-local build

remote: config-remote build

build: clean
	jekyll build --destination $(SITE_DIR)

open:
	python -m webbrowser "http://localhost:8080"

local: build open
	cd docs && python -m SimpleHTTPServer 8080

serve: config-local open
	jekyll serve

config-local: clean-config
	cp -rf $(LOCAL_CONFIG) $(CONFIG)

config-remote:
	cp -rf $(REMOTE_CONFIG) $(CONFIG)

clean-config:
	rm -r -f $(CONFIG)

clean:
	rm -r -f $(SITE_DIR)

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

windows-deps-gems:
	sudo gem install jekyll
	sudo gem install bundler
	sudo gem install nokogiri # this frequently fails if not run manually
	bundle install
	# these should be install with bundler, but if not...
	# sudo gem install jekyll-paginate
	# sudo gem install jekyll-sitemap
	# sudo gem install jemoji
