default:
	make -C _jekyll

remote:
	make -C _jekyll remote

DEPLOY_PATH=_jekyll/_site/
DEPLOY_BLACKLIST=-name 'Gemfile' -name 'Gemfile.lock' -name 'Makefile'
deploy: deploy-clean
	make -C _jekyll deploy
	cp -r -f $(DEPLOY_PATH)* .

DEPLOY_WHITELIST=-not -name '.git' -not -name '_archives' -not -name '_jekyll' -not -name '.gitignore' -not -name 'LICENSE.md' -not -name 'Makefile' -not -name 'README.md'
deploy-clean:
	find . -maxdepth 1 -type f $(DEPLOY_WHITELIST) -delete
