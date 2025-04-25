local telescope = require('telescope')
local builtin = require('telescope.builtin')
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-f>"] = lga_actions.quote_prompt({ postfix = " -g '!tags' -g '!build-*/' -g '!tests/' -g '!unittests/' -g '!*.cmake' -g '!*.vsbl'" }),
        },
      },
    },
  },
}

vim.keymap.set('n', '<F6>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<F3>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Telescope live grep' })
