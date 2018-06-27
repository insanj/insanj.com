BASE_CONFIG=_config_base.yml
CONFIG=_config.yml
SITE_DIR=_site
SITE_FLAG=julian-site: 
LOCAL_SITE=http://127.0.0.1:4000/
LOCAL_SITE_PORT=4000
REMOTE_SITE=https://insanj.github.io/insanj.com/

default: config-local serve

remote: config-remote build

deploy: remote deploy-clean

serve: config-local open
	jekyll serve --destination $(SITE_DIR)

build: clean
	jekyll build --destination $(SITE_DIR)

open:
	python -m webbrowser "$(LOCAL_SITE)"

local: build open
	cd docs && python -m SimpleHTTPServer $(LOCAL_SITE_PORT)

config-local: setup-config
	echo "$(SITE_FLAG)$(LOCAL_SITE)" >> $(CONFIG)

config-remote: setup-config
	echo "$(SITE_FLAG)$(REMOTE_SITE)" >> $(CONFIG)

setup-config: clean-config
	cp -rf $(BASE_CONFIG) $(CONFIG)

clean-config:
	rm -r -f $(CONFIG)

clean:
	rm -r -f $(SITE_DIR)

DEPLOY_WHITELIST=-not -name '.git' -not -name '_archives' -not -name '_jekyll' -not -name '.gitignore' -not -name 'LICENSE.md' -not -name 'Makefile' -not -name 'README.md'
deploy-clean:
	find . $(DEPLOY_WHITELIST) -type f -exec rm -f {} +

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
