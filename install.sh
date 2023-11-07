#!/bin/sh

ln -s $(realpath .xinitrc) $HOME/.xinitrc

cd dwm
make clean
make install
make clean
cd ..

cd st
make clean
make install
make clean
cd ..

cd dmenu
make clean
make install
make clean
cd ..
