-- global variables
Config_path = vim.fn.stdpath('config')
Init_path = Config_path .. '/init.lua'

-- load bindings
require 'defaults'
require 'search'
require 'grep'
require 'lsp'
require 'keybinds'
