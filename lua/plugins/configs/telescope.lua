local builtin = require('telescope.builtin')

vim.keymap.set('n', '<F6>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<F3>', builtin.live_grep, { desc = 'Telescope live grep' })
