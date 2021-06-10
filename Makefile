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
	echo y | ${BIN}mypy --install-types
	${BIN}mypy nhl_client
	${BIN}pytest tests

clean:
	${CLEAN}

format:
	iostat ${MODULE}
	black ${MODULE}
