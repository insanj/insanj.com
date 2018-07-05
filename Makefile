serve: archives
	make -C _jekyll serve

build:
	make -C _jekyll build

remote:
	make -C _jekyll remote

ghpages:
	make -C _jekyll ghpages

DEPLOY_PATH=_jekyll/_site/
deploy: build deploy-clean-build deploy-clean-root
	cp -r -f $(DEPLOY_PATH)* .

DEPLOY_WHITELIST=-not -name '.git' -not -name '_archives' -not -name '_jekyll' -not -name '.gitignore' -not -name 'LICENSE.md' -not -name 'Makefile' -not -name 'README.md' -not -name '.gitftpignore' 
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

chmod:
	chmod -R 0755 .

.PHONY: upload
upload: upload-clean deploy
	git clone https://github.com/ezyang/git-ftp
	python git-ftp/git-ftp.py
	
DEPLOY_CREDS_PATH=.git/ftpdata
upload-init:
	@echo "[archives-page]" > $(DEPLOY_CREDS_PATH)
	@echo "username=" >> $(DEPLOY_CREDS_PATH)
	@echo "password=" >> $(DEPLOY_CREDS_PATH)
	@echo "hostname=ftp.insanj.com" >> $(DEPLOY_CREDS_PATH)
	@echo "remotepath=/beta/" >> $(DEPLOY_CREDS_PATH)
	@echo "ssl=no" >> $(DEPLOY_CREDS_PATH)
	@echo "gitftpignore=.gitftpignore" >> $(DEPLOY_CREDS_PATH)

upload-deps:
	easy_install gitpython

upload-clean:
	rm -r -f git-ftp
