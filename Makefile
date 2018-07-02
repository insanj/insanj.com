default: archives
	make -C _jekyll

remote:
	make -C _jekyll remote

DEPLOY_PATH=_jekyll/_site/
deploy: remote deploy-clean-build deploy-clean-root
	cp -r -f $(DEPLOY_PATH)* .

DEPLOY_WHITELIST=-not -name '.git' -not -name '_archives' -not -name '_jekyll' -not -name '.gitignore' -not -name 'LICENSE.md' -not -name 'Makefile' -not -name 'README.md'
deploy-clean-root:
	find . -maxdepth 1 -type f $(DEPLOY_WHITELIST) -exec rm -r {} \; # files
	find . -maxdepth 1 $(DEPLOY_WHITELIST) -exec rm -r {} \; # dirs

deploy-clean-build:
	find $(DEPLOY_PATH) -name Gemfile.lock -exec rm -r {} \;
	find $(DEPLOY_PATH) -name Gemfile -exec rm -r {} \;
	find $(DEPLOY_PATH) -name Makefile -exec rm -r {} \;

ARCHIVES_PATH=_archives
.PHONY: archives
archives:
	(sleep 3; cp -r -f $(ARCHIVES_PATH) $(DEPLOY_PATH)) &

#ln -sf ../$(ARCHIVES_DIR) $(SITE_DIR)/$(ARCHIVES_DIR)
# cp -rf $(ARCHIVES_DIR) $(SITE_DIR)
