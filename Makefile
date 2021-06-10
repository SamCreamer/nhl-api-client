ifeq ($(OS),Windows_NT)
    BIN := env\\Scripts\\
    CLEAN := rd /s /q "env" || echo
else
    BIN := env/bin/
    CLEAN := rm -rf env
endif

PIP := ${BIN}python -m pip
MODULE := nhl_api_client


develop:
	python -m venv env
	${PIP} install pip-tools
	${BIN}pip-compile requirements.in
	${PIP} install -r requirements-dev.txt

test: develop
	echo y | ${BIN}mypy ${MODULE} --install-types
	${BIN}pytest tests

clean:
	${CLEAN}

format:
	${BIN}isort ${MODULE}
	${BIN}black ${MODULE}
