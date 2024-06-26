.PHONY: all install link_xinitrc link_nvim link_bashrc build_dwm build_st build_dmenu update_fonts run_scripts_makefile

all: install

install: link_xinitrc link_nvim link_bashrc build_dwm build_st build_dmenu update_fonts run_scripts_makefile

link_xinitrc:
	@echo "Linking .xinitrc"
	@ln -sf "$(realpath .xinitrc)" "$(HOME)/.xinitrc"

link_nvim:
	@echo "Linking $(realpath ./nvim)   $(HOME)/.config/nvim"
	@mkdir -p "$(HOME)/.config"
	@ln -sf "$(realpath ./nvim)" "$(HOME)/.config/nvim"

link_bashrc:
	@echo "Linking .bashrc"
	@ln -sf "$(realpath .bashrc)" "$(HOME)/.bashrc"

build_dwm:
	@echo "Building dwm"
	@cd dwm && make clean && sudo make install && make clean

build_st:
	@echo "Building st"
	@cd st && make clean && sudo make install && make clean

build_dmenu:
	@echo "Building dmenu"
	@cd dmenu && make clean && sudo make install && make clean

update_fonts: link_fonts

link_fonts:
	@echo "Linking fonts"
	@mkdir -p "$(HOME)/.fonts"
	@ln -sf $(realpath font)/* "$(HOME)/.fonts/"
	@echo "Updating font cache"
	@fc-cache -fv

run_scripts_makefile:
	@echo "Running Makefile in scripts directory"
	@cd scripts && make

