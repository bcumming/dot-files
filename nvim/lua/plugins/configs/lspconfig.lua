-- mason and mason-lspconfig are configured here because they must be configured
-- before lspconfig
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "clangd", "pyright"}
}

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.lua_ls.setup{}
lspconfig.pyright.setup{}
