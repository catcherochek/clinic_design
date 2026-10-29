PORT ?= 8000

.PHONY: dev
dev: ## Start a local dev server (override with PORT=xxxx)
	@echo "Serving clinic site at http://localhost:$(PORT) (Ctrl+C to stop)"
	@python3 -m http.server $(PORT)

.PHONY: help
help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
