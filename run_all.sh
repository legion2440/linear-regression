#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JUPYTER="$ROOT_DIR/.venv/Scripts/jupyter.exe"
export PYTHONWARNINGS="ignore::RuntimeWarning:zmq._future"

if [[ ! -x "$JUPYTER" ]]; then
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
  "$JUPYTER" nbconvert \
    --to notebook \
    --execute \
    --inplace \
    --ExecutePreprocessor.timeout=1200 \
    --ExecutePreprocessor.kernel_name=python3 \
    "$ROOT_DIR/$notebook"
done
