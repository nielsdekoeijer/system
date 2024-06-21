-- lsp configuration for lua
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
    pattern = "lua",
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ '.git' }, { upward = true })[1]
        )
        local config = {
            name = 'lua-lanaguage-server',
            cmd = { 'lua-language-server' },
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            root_dir = root_dir,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.RUNTIME
                        }
                    }
                }
            },
        }

        config.on_init = function(client, _)
            local attach = function()
                vim.lsp.buf_attach_client(0, client.id)
            end

            autocmd = vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    "lua"
                },
                callback = attach
            })

            if vim.v.vim_did_enter == 1 and
                vim.tbl_contains("lua", vim.bo.filetype) then
                attach()
            end
        end

        vim.lsp.start(config)
    end
})
