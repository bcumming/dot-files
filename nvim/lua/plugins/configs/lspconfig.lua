require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pylsp",
        "ruff",
        --"ltex_plus",
    },
    automatic_enable = true,
})

-- disable pylsp's linters in favour of ruff lsp
vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false },
                pyflakes    = { enabled = false },
                mccabe      = { enabled = false },
            }
        }
    }
})
