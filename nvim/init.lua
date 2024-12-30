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

-- enable 24-bit RGB colors
vim.opt.termguicolors = true

-- Disable annoying deprecated message
vim.deprecate = function() end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
            lazypath })
end
vim.opt.rtp:prepend(lazypath)

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

for _, source in ipairs({
	"plugins",
	"options",
	"mappings",
}) do
	local ok, fault = pcall(require, source)
	if not ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

