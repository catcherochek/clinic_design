PORT ?= 8000

.PHONY: dev
dev: ## Start a local dev server (override with PORT=xxxx)
	@echo "Serving clinic site at http://localhost:$(PORT) (Ctrl+C to stop)"
	@python3 -m http.server $(PORT)

.PHONY: zip
zip: ## Create Archive.zip of the site (index.html, service.html, assets/)
	@rm -f Archive.zip
	@zip -r Archive.zip index.html service.html assets
	@echo "Created Archive.zip"

.PHONY: help
help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
