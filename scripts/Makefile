# Makefile for symlinking scripts from the current directory to /usr/local/bin without the .sh suffix

# Define the destination directory
DEST = /usr/local/bin

# Get all scripts in the current directory
SCRIPTS = $(wildcard *.sh)

# Default target to create symlinks
install: $(SCRIPTS)
	@echo "Creating symlinks in $(DEST)..."
	@for script in $(SCRIPTS); do \
		script_name=$$(basename $$script .sh); \
		echo "Symlinking $$script_name to $(DEST)"; \
		ln -sf $$(pwd)/$$script $(DEST)/$$script_name; \
	done
	@echo "Symlinks creation complete."


.PHONY: install

