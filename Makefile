chrome:
	@rm -f release/loic.chrome.zip
	@cd src/core/ && zip -q -r9 ../../release/loic.chrome.zip * -x "*/\.*" -x "\.*"
	@/bin/echo "[Cryptocat] Chrome build available in release/"

firefox:
	@rm -f release/loic.firefox.xpi
	@cp -r src/core/* src/firefox/chrome/content/data/
	@cd src/firefox/ && zip -q -r9 ../../release/loic.firefox.xpi * -x "*/\.*" -x "\.*"
	@rm -r src/firefox/chrome/content/data/*
	@/bin/echo "[Loic] Firefox build available in release/"

safari:
	@rm -rf src/loic.safariextension
	@cp -R src/core src/loic.safariextension
	@cp -R src/safari/* src/loic.safariextension
	@/bin/echo "[Cryptocat] Safari extension packaged for testing."

mac:
	@rm -rf release/loic.app
	@rm -rf release/loic.mac.zip
	@rm -rf src/mac/htdocs
	@cp -R src/core src/mac/htdocs
	@xcodebuild -project src/mac/loic.xcodeproj -configuration 'Release' -alltargets clean
	@xcodebuild CONFIGURATION_BUILD_DIR="${PWD}/release" -project src/mac/loic.xcodeproj -configuration 'Release' build
	@rm -rf release/loic.app.dSYM
	@cd release && zip -q -r9 loic.mac.zip loic.app
	@/bin/echo "[Cryptocat] Mac app available in release/"

tests:
	@/bin/echo -n "[Cryptocat] Running tests... "
	@`/usr/bin/which npm` install
	@node_modules/.bin/mocha --ui exports --reporter spec test/core/js/*.test.js

lint:
	@node_modules/.bin/jshint --verbose --config .jshintrc \
		src/core/js/loic.js \
		src/core/js/lib/multiParty.js \
		src/core/js/lib/elliptic.js \
		src/core/js/lib/salsa20.js \
		src/core/js/etc/*.js \
		src/standaloneServer.js \
		test/testBase.js \
		test/core/js/*.js

all: lint tests
