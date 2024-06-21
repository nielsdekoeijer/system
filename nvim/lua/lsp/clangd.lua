-- lsp configuration for clang
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
    pattern = {"cpp", "c", "h"},
    callback = function()
        local search = vim.fs.find({ '.git' }, { upward = true })
        local root_dir = vim.fs.dirname(search[1])

        local custom_config_path = vim.fs.find({ '.lsp.lua' }, { path = root_dir })[1]
        local config

        if custom_config_path ~= nil then
            package.path = package.path .. ";" .. custom_config_path
            local custom_config = require('.lsp.lua')
            config = custom_config.Get(root_dir)
        else
            config = {
                name = 'clangd',
                cmd = {'clangd'},
                root_dir = root_dir,
            }
        end

        local client = vim.lsp.start(config)
        vim.lsp.buf_attach_client(0, client)
    end
})
