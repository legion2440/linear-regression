# linear-regression

## Автор
- Nazar Yestayev (@nyestaye / @legion2440)

## Запуск
- `python -m venv .venv`
- `./.venv/Scripts/python.exe -m pip install -r requirements.txt`
- `bash ./run_all.sh`
- `./.venv/Scripts/jupyter.exe lab`

## Структура
- `ex00`-`ex05` содержат решения по упражнениям в отдельных notebooks.
- `data/legacy` хранит официальные файлы diabetes dataset из `scikit-learn 0.22.2.post1`, чтобы `ex04` воспроизводил audit-значения без дрейфа новых версий.
