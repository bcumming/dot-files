-- Key mapping configuration

local map = vim.keymap.set

vim.keymap.set('n', '<left>', '<cmd>tabprev<CR>')
vim.keymap.set('n', '<right>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<up>', '<cmd>tabm -1<CR>')
vim.keymap.set('n', '<down>', '<cmd>tabm +1<CR>')

vim.keymap.set('n', '<leader><down>', '<cmd>resize -5<CR>')
vim.keymap.set('n', '<leader><up>', '<cmd>resize +5<CR>')
vim.keymap.set('n', '<leader><left>', '<cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<leader><right>', '<cmd>vertical resize -5<CR>')

-- reload configuration
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', {desc = "reload nvim configuration"})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Open Telescope to find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Open Telescope to do live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Open Telescope to list buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Open Telescope to show help" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Open Telescope to list recent files" })
map("n", "<leader>cm", builtin.git_commits, { desc = "Open Telescope to list git commits" })

-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree sidebar" })    -- open/close
map("n", "<leader>nr", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })         -- refresh
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "Search file in NvimTree" }) -- search file
