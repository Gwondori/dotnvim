-- VimPlug Start
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug("github/copilot.vim")
Plug("nvim-treesitter/nvim-treesitter", { ['do'] = function()
	vim.call("TSUpdate")
end, ["tag"] = "v0.9.2" })
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope-live-grep-args.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" }) 
Plug("neoclide/coc.nvim", { ['branch'] = 'release' })
Plug("vim-scripts/vcscommand.vim")
Plug("jiangmiao/auto-pairs")
Plug("github/copilot.vim", { ["tag"] = "v1.12.1" })
Plug("scottmckendry/cyberdream.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("sindrets/diffview.nvim")
Plug("akinsho/bufferline.nvim", { ["tag"] = '*' })

vim.call('plug#end')
-- End of VimPlug
