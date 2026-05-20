require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        --"pyright",
        --"ltex_plus",
    },
    automatic_enable = true,
})
