-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
            lazypath })
end
vim.opt.rtp:prepend(lazypath)

local builtin_plugins = {
    "nvim-lua/plenary.nvim",
    -- tree file explorer
    {
        "nvim-tree/nvim-tree.lua",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
            opt = true
        },
        opts = function()
            require("plugins.configs.tree")
        end,
    },
    -- Treesitter interface
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        evevent = { "BufReadPost", "BufNewFile", "BufWritePost" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            require("plugins.configs.treesitter")
        end,
    },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            }
        },
        cmd = "Telescope",
        config = function(_)
            require("telescope").setup {}
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("fzf")
            require("plugins.configs.telescope")
        end
    },
    -- Keymappings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },
    -- color scheme
    {
        "bcumming/vim-luna",
        name = "vim-luna"
    },
    -- LSP plugins
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig",
        -- start the plugin automatically when loading or creating a file
        event = { "bufReadPre", "BufNewFile" },
        config = function()
            require("plugins.configs.lspconfig")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- snippet engine
            {
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                end,
            },
            -- autopairing of (){}[] etc
            { "windwp/nvim-autopairs" },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "onsails/lspkind.nvim",
            },
        },
        opts = function()
            require("plugins.configs.cmp")
        end,
    },
    -- for editing neovim config files
    {
        "folke/neodev.nvim",
    },
    -- for formatting
    {
        "stevearc/conform.nvim",
        config = function()
            require("plugins.configs.conform")
        end
    },
    -- AI nonsense
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        opts = {
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua",      -- for providers='copilot'
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    -- Something silly
    {
        "giusgad/pets.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
        opts = function()
            require("plugins.configs.pets")
        end,
    }
}

require("lazy").setup({
    spec = { builtin_plugins },
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    defaults = {
        -- by default load plugins eagerly (unless overriden in the configuration
        lazy = false,
        -- use the most recent commit
        -- version = nil
        -- use the most recent stable/tagged version
        version = "*"
    },
    install = {
        -- install missing plugins on startup
        missing = true,
        colorscheme = { "luna" },
    },
    checker = {
        enabled = true,
        notify = false,
        -- check for updated packages daily
        frequency = 86400,
    },
    performance = {
        cache = {
            enabled = true
        }
    },
    state = vim.fn.stdpath("state") .. "/lazy/state.json"
})
