-- enable 24-bit RGB colors
vim.opt.termguicolors = true

-- check for required command line tools
for _, cmd in ipairs({ "git", "rg", "fd" }) do
    local name = cmd
    local commands = { cmd }
    ---@cast commands string[]
    local found = false

    for _, c in ipairs(commands) do
        if vim.fn.executable(c) == 1 then
            name = c
            found = true
        end
    end

    if not found then
        error(("`%s` is not installed"):format(name))
    end
end


--  must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
