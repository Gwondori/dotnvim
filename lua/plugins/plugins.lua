-- VimPlug Start
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug("nvim-treesitter/nvim-treesitter", { ['do'] = function()
	vim.call("TSUpdate")
end })
Plug("neoclide/coc.nvim", { ['branch'] = 'release' })
Plug("vim-scripts/vcscommand.vim")
Plug("jiangmiao/auto-pairs")
Plug("github/copilot.vim")
Plug("scottmckendry/cyberdream.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")

vim.call('plug#end')
-- End of VimPlug
