FROM python:3.13-slim

WORKDIR /app

RUN pip install --no-cache-dir uv

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-dev

COPY . .

CMD ["uv", "run", "jupyter", "nbconvert", "--to", "notebook", "--execute", "notebooks/5.2_assignment.ipynb", "--output", "executed_5.2_assignment.ipynb"]