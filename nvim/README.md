# init.lua
Fully from scratch. No plugins.

## System dependencies:
Custom plugins
```
ripgrep fzf 
```

LSPs
```
clangd clang-format
```

## Installing dependencies with apt:
Assuming `clangd-15`. Note the `update-alternatives` is critical!
```
sudo apt install ripgrep fzf clangd-15 clang-format-15 luarocks
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-15 9
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clangd-format-15 9
```
