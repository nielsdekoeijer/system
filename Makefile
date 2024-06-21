.PHONY: all install check_root link_xinitrc link_nvim link_bashrc build_dwm build_st build_dmenu update_fonts

all: install

install: check_root link_xinitrc link_nvim link_bashrc build_dwm build_st build_dmenu update_fonts

check_root:
	@if [ "$$(id -u)" -ne 0 ]; then \
		echo "This script must be run as root. Exiting."; \
		exit 1; \
	fi

link_xinitrc:
	@echo "Linking .xinitrc"
	@ln -sf "$(realpath .xinitrc)" "$(HOME)/.xinitrc"

link_nvim:
	@echo "Linking .config/nvim"
	@mkdir -p "$(HOME)/.config"
	@ln -sf "$(realpath nvim)" "$(HOME)/.config/nvim"

link_bashrc:
	@echo "Linking .bashrc"
	@ln -sf "$(realpath .bashrc)" "$(HOME)/.bashrc"

build_dwm:
	@echo "Building dwm"
	@cd dwm && make clean && make install && make clean

build_st:
	@echo "Building st"
	@cd st && make clean && make install && make clean

build_dmenu:
	@echo "Building dmenu"
	@cd dmenu && make clean && make install && make clean

update_fonts: update_git_submodules link_fonts

update_git_submodules:
	@echo "Updating git submodules"
	@git submodule init
	@git submodule update --recursive

link_fonts:
	@echo "Linking fonts"
	@mkdir -p "$(HOME)/.fonts"
	@ln -sf $(realpath font)/* "$(HOME)/.fonts/"
	@echo "Updating font cache"
	@fc-cache -fv

