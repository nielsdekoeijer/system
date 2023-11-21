#!/bin/sh

# Check for 'all' argument
if [ "$1" = "all" ]; then
    auto_confirm=true
else
    auto_confirm=false
fi

confirm() {
    if [ "$auto_confirm" = false ]; then
        echo "$1 [y/N]"
        read -r answer
        if [ "$answer" != "y" ]; then
            return 1
        fi
    fi
    return 0
}

# Link .xinitrc
if confirm "Would you like to link .xinitrc?"; then
    ln -s "$(realpath .xinitrc)" "$HOME/.xinitrc"
fi

# Link nvim
if confirm "Would you like to link .config/nvim?"; then
    mkdir -p "$HOME/.config"
    ln -s "$(realpath nvim)" "$HOME/.config/nvim"
fi

# Link nvim
if confirm "Would you like to link .bashrc?"; then
    ln -s "$(realpath .bashrc)" "$HOME/.bashrc"
fi

# Build dwm
if confirm "Would you like to build dwm?"; then
    cd dwm || exit
    make clean
    make install
    make clean
    cd ..
fi

# Build st
if confirm "Would you like to build st?"; then
    cd st || exit
    make clean
    make install
    make clean
    cd ..
fi

# Build dmenu
if confirm "Would you like to build dmenu?"; then
    cd dmenu || exit
    make clean
    make install
    make clean
    cd ..
fi

