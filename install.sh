#!/bin/sh

ln -s $(realpath .xinitrc) $HOME/.xinitrc

cd dwm
make install
cd ..

cd st
make install
cd ..

cd dmenu
make install
cd ..
