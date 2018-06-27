
build: clean
	jekyll build --destination docs

local: build
	open "http://localhost:8080"
	cd docs && python -m SimpleHTTPServer 8080

serve:
	open "http://127.0.0.1:4000/"
	jekyll serve

clean:
	rm -r -f _site

deps:
	gem install jekyll-paginate