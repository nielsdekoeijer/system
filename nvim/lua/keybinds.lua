-- leader
vim.g.mapleader = " "

-- reload init.lua
vim.api.nvim_set_keymap('n'
, '<Leader>dr'
, [[<Cmd>luafile ]] .. Init_path .. [[<CR>]]
, { noremap = true, silent = true })

-- edit init.lua
vim.api.nvim_set_keymap('n'
, '<Leader>de'
, [[<Cmd>e ]] .. Init_path .. [[<CR>]]
, { noremap = true, silent = true })

-- buffer next
vim.api.nvim_set_keymap('n'
, '<Leader>k'
, [[<Cmd>bn<CR>]]
, { noremap = true, silent = true })

-- buffer next
vim.api.nvim_set_keymap('n'
, '<Leader>j'
, [[<Cmd>bp<CR>]]
, { noremap = true, silent = true })

-- write quit
vim.api.nvim_set_keymap('n'
, '<Leader>w'
, [[<Cmd>wqa<CR>]]
, { noremap = true, silent = true })

-- quit
vim.api.nvim_set_keymap('n'
, '<Leader>q'
, [[<Cmd>qa<CR>]]
, { noremap = true, silent = true })

-- show debug log
vim.api.nvim_set_keymap('n'
, '<Leader>dl'
, [[<Cmd>lua Open_debug_buffer()<CR>]]
, { noremap = true, silent = true })

-- interactive file search
vim.api.nvim_set_keymap('n'
, '<Leader>sf'
, [[<Cmd>lua Interactive_search("e")<CR>]]
, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n'
, '<Leader>ss'
, [[<Cmd>lua Interactive_search("vsp")<CR>]]
, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n'
, '<Leader>sn'
, [[<Cmd>lua Interactive_search("e", Config_path .. "/" .. "notes")<CR>]]
, { noremap = true, silent = true })

-- interactive file grep
vim.api.nvim_set_keymap('n'
, '<Leader>sg'
, [[<Cmd>lua Interactive_grep()<CR>]]
, { noremap = true, silent = true })

-- terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert"
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "term://*",
    command = "startinsert"
})

vim.api.nvim_set_keymap('t'
, '<Esc>'
, [[<C-\><C-n>]]
, { noremap = true, silent = true })

vim.api.nvim_set_keymap('t'
, '<C-w>'
, [[<C-\><C-n><C-w>]]
, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n'
, '<Leader>t'
, [[<Cmd>belowright split | execute "resize 25" | terminal <CR>]]
, { noremap = true, silent = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.bo[ev.buf].completefunc = 'v:lua.vim.lsp.completefunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
