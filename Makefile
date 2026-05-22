NOTEBOOK = 5.2_assignment(1).ipynb
EXECUTED = 5.2_assignment_executed.ipynb

.PHONY: run html clean

run:
	uv run jupyter nbconvert --to notebook --execute "$(NOTEBOOK)" --output "$(EXECUTED)"

html:
	uv run jupyter nbconvert --to html "$(NOTEBOOK)"

clean:
	rm -f "$(EXECUTED)" 5.2_assignment\(1\).html