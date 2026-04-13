#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PYTHONWARNINGS="ignore::RuntimeWarning:zmq._future"

if [[ -x "$ROOT_DIR/.venv/bin/python" ]]; then
  PYTHON="$ROOT_DIR/.venv/bin/python"
elif [[ -x "$ROOT_DIR/.venv/Scripts/python.exe" ]]; then
  PYTHON="$ROOT_DIR/.venv/Scripts/python.exe"
else
  echo "Local virtual environment is missing. Create .venv and install requirements first." >&2
  exit 1
fi

notebooks=(
  "ex00/ex00.ipynb"
  "ex01/ex01.ipynb"
  "ex02/ex02.ipynb"
  "ex03/ex03.ipynb"
  "ex04/ex04.ipynb"
  "ex05/ex05.ipynb"
)

for notebook in "${notebooks[@]}"; do
  echo "Executing $notebook"
  "$PYTHON" -m jupyter nbconvert \
    --to notebook \
    --execute \
    --inplace \
    --ExecutePreprocessor.timeout=1200 \
    --ExecutePreprocessor.kernel_name=python3 \
    "$ROOT_DIR/$notebook"
done
