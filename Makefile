.PHONY: check clean diff-clean lint local test

dev-requirements:
	@echo "Installing poetry on default Python interpreter"
	@curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

check:
	@poetry run python -m mypy .
	@poetry run pyflakes .

clean:
	@echo "Removing cache files..."
	@find . -name "__pycache__" -print0 | xargs -0 rm -rf

diff-clean:
	@git diff -- . ':(exclude)poetry.lock'

lint:
	@poetry run isort .
	@poetry run python -m black .

local:
	@echo "Spawning app on local development Python server..."
	@poetry run python manage.py runserver

shell:
	@poetry run python manage.py shell

#TODO: Add in coverage limits.
test:
	@poetry run pytest polls

tree:
	@tree -a -I ".mypy_cache|.git"
