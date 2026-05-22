NOTEBOOK_DIR = notebooks
NOTEBOOK = 5.2_assignment.ipynb
EXECUTED = 5.2_assignment_executed.ipynb
HTML = 5.2_assignment.html

.PHONY: help run html clean

help:
	@echo "Available commands:"
	@echo "  make run    - execute the notebook"
	@echo "  make html   - export the notebook to HTML"
	@echo "  make clean  - remove generated files"

run:
	uv run jupyter nbconvert --to notebook --execute "$(NOTEBOOK_DIR)/$(NOTEBOOK)" --output "$(EXECUTED)" --output-dir "$(NOTEBOOK_DIR)"

html:
	uv run jupyter nbconvert --to html "$(NOTEBOOK_DIR)/$(NOTEBOOK)" --output "$(HTML)" --output-dir "$(NOTEBOOK_DIR)"

clean:
	uv run python -c "from pathlib import Path; [p.unlink(missing_ok=True) for p in [Path('$(NOTEBOOK_DIR)/$(EXECUTED)'), Path('$(NOTEBOOK_DIR)/$(HTML)')]]"