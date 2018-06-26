
build: clean
	jekyll build --destination docs
	
serve:
	open "http://127.0.0.1:4000/"
	jekyll serve

clean:
	rm -r -f _site

deps:
	gem install jekyll-paginate