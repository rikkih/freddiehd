.PHONY: check clean lint test

dev-requirements:
	@echo "Installing poetry on default Python interpreter"
	@curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

check:
	@poetry run python -m mypy .

clean:
	@echo "Removing cache files..."
	@find . -name "__pycache__" -print0 | xargs -0 rm -rf

lint:
	@poetry run python -m black .

#TODO: Add in coverage limits.
test:
	@poetry run python -m pytest tests
