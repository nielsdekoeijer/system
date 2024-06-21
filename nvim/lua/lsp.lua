-- lua lsps
require 'lsp.clangd'
require 'lsp.lua'
require 'lsp.rust_analyzer'
require 'lsp.zig'
require 'lsp.python'

-- always format on save
vim.lsp.buf.format({ async = false })
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
