ifndef BROWSERS
BROWSERS = Chrome Firefox
endif

.PHONY: default npm test generate compare update-ref diff-browsers travis

default: npm generate compare

npm:
	npm install
test:
	npm test
dev:
	(./scripts/generate-browser-xml Chrome && ./scripts/compare-with-reference-xml Chrome) || less ./build/logs/Chrome.log
generate:
	./scripts/generate-browser-xml ${BROWSERS}
compare:
	./scripts/compare-with-reference-xml ${BROWSERS}
update-ref:
	./scripts/update-reference-xml
diff-browsers:
	./scripts/compare-generated ${BROWSERS}
travis: npm test generate compare
