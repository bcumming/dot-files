-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '<left>', '<cmd>tabprev<CR>')
vim.keymap.set('n', '<right>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<up>', '<cmd>tabm -1<CR>')
vim.keymap.set('n', '<down>', '<cmd>tabm +1<CR>')

vim.keymap.set('n', '<leader><down>', '<cmd>resize -5<CR>')
vim.keymap.set('n', '<leader><up>', '<cmd>resize +5<CR>')
vim.keymap.set('n', '<leader><left>', '<cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<leader><right>', '<cmd>vertical resize -5<CR>')

return {}
