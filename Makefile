PYTHON=python3
PIP=pip
ENV_DIR=env
ENV_ACTIVATE=$(ENV_DIR)/bin/activate
FASTAPI_APP=main:app  


$(ENV_DIR)/bin/activate: requirements.txt
	$(PYTHON) -m venv $(ENV_DIR)
	$(ENV_DIR)/bin/$(PIP) install -r requirements.txt


install: $(ENV_DIR)/bin/activate
	$(ENV_DIR)/bin/$(PIP) install -r requirements.txt


run: $(ENV_DIR)/bin/activate
	. $(ENV_ACTIVATE) && uvicorn $(FASTAPI_APP) --reload


test: $(ENV_DIR)/bin/activate
	. $(ENV_ACTIVATE) && pytest


lint: $(ENV_DIR)/bin/activate
	. $(ENV_ACTIVATE) && flake8


format: $(ENV_DIR)/bin/activate
	. $(ENV_ACTIVATE) && black .


clean:
	rm -rf $(ENV_DIR)
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type d -name ".pytest_cache" -exec rm -r {} +


help:
	@echo "Makefile for FastAPI project"
	@echo ""
	@echo "Usage:"
	@echo "  make install     Install dependencies"
	@echo "  make run         Run the FastAPI server"
	@echo "  make test        Run tests"
	@echo "  make lint        Lint the code"
	@echo "  make format      Format the code"
	@echo "  make clean       Clean up the environment"
	@echo "  make help        Show this help message"

.PHONY: install run test lint format clean help
