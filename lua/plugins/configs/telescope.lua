local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<F6>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<F3>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Telescope live grep' })
