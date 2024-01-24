#!/bin/sh

ln -s $(realpath .xinitrc) $HOME/.xinitrc
ln -s $(realpath ./scripts/connect.sh) $HOME/connect.sh
ln -s $(realpath ./scripts/status.sh) $HOME/status.sh

# dwm
cd dwm
make clean
rm config.h
sudo make install
make clean
rm config.h
cd ..

# st
cd st
make clean
rm config.h
sudo make install
make clean
rm config.h
cd ..

# demnu
cd dmenu
make clean
rm config.h
sudo make install
make clean
rm config.h
cd ..
