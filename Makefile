build: clean
	jekyll build --destination docs

open:
	ifeq ($(OS),Windows_NT)
		explorer "http://localhost:8080"
	else
		open "http://localhost:8080"
	endif

local: build open
	cd docs && python -m SimpleHTTPServer 8080

serve: open
	jekyll serve

clean:
	rm -r -f _site

deps:
	gem install jekyll bundler jekyll-paginate
	bundle install
	
windows-deps: # steps that may be required in a new Ubuntu environment
	sudo apt-get update
	sudo apt-get install ruby-full
	sudo apt install gcc
	sudo apt install g++
	sudo apt-get install zlib1g-dev
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

