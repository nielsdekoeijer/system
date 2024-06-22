from voidlinux/voidlinux
run echo "repository=https://repo-eu.voidlinux.org/current" > /etc/xbps.d/00-repository-main.conf
run echo noextract=/etc/hosts > /etc/xbps.d/test.conf
run xbps-install -dSuy xbps
run xbps-install -dSuy 
run xbps-install --yes make sudo gcc libX11-devel libXext-devel libXinerama-devel pkg-config libXft-devel freetype-devel ncurses
workdir /workspace/

