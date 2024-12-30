local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local s = vim.s

opt.clipboard = "unnamedplus"                -- allow neovim to access the system clipboard
vim.opt.fileencoding = "utf-8"               -- the encoding written to a file
opt.encoding = "utf-8"                       -- the encoding
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.syntax = "enable"

-- indentation
local indent = 4
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent

-- search
opt.hlsearch = true   -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns

-- ui
opt.cursorline = true -- highlight the current line
opt.laststatus = 2    -- only the last window will always have a status line
opt.lazyredraw = true -- don"t update the display while executing macros
opt.list = true
opt.listchars = {
    tab = "┊ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "×"
}

-- persistent undo
local undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true -- enable persistent undo
opt.undodir = undodir
opt.undolevels = 1000
opt.undoreload = 10000

-- color
cmd.colorscheme("luna")
