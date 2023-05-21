.PHONY: setup
setup:
	@ echo "Setting up Python venv..."
	@ ( test -d .venv && echo "> .venv already setup." ) || ( python -m venv .venv && python -m pip install --upgrade pip && echo "> .venv setup!" )
	@ printf "\n"

	@ echo "Updating Python venv pip version..."
	@ . .venv/bin/activate && python -m pip install --upgrade pip
	@ printf "\n"

	@ echo "Installing project requirements into Python venv..."
	@ . .venv/bin/activate && pip install -Ur requirements.txt
	@ printf "\n"

	@ echo "[[ WARN ]] Remember to run '. .venv/bin/activate' to activate the projects Python venv on your current shell session!"
	@ printf "\n"
	@ echo "Done."

.PHONY: reqs
reqs:
	@ echo "Updating the projects requirements.txt from Python venv..."
	@ . .venv/bin/activate && pip freeze > requirements.txt
	@ printf "\n"

	@ echo "Done."

.PHONY: reset
reset:
	@ echo "Deactivating Python venv..."
	@ ( test -d .venv && . .venv/bin/activate && deactivate && echo "> Python venv deactivated." ) || echo "> Python venv already deactivated."
	@ printf "\n"

	@ echo "Deleting all Python venv files..."
	@ ( test -d .venv && rm -rf .venv && echo "> Python venv deleted." ) || echo "> Python venv already deleted."
	@ printf "\n"

	@ echo "Done."