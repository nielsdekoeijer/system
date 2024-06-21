-- search, aka homebrew telescope

function Interactive_grep()
    -- assert rg installed
    if vim.fn.system("which rg") == 1 then
        vim.api.nvim_out_write("command 'rg' non-zero return, please install rg!\n")
        return
    end

    -- assert fzf installed
    if vim.fn.system("which fzf") == 1 then
        vim.api.nvim_out_write("command 'fzf' non-zero return, please install fzf!\n")
        return
    end

    -- make buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = 80,
        height = 20,
        col = 10,
        row = 10
    })

    -- our command
    local dir_path = vim.fn.expand('%:p:h')
    local cmd = "rg " .. dir_path .. " | fzf"

    -- run
    vim.fn.termopen(cmd, { buffer = buf,
        on_exit = function(_, exit_code)
            vim.api.nvim_win_close(0, true)
            if exit_code == 0 then
                local output = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
                vim.api.nvim_command("e " .. dir_path .. "/" .. output[1])
            end
        end,
    })

    -- start inserted (no idea how this works)
    vim.cmd [[startinsert]]
end
