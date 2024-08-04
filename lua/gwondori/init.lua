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

vim.call('plug#end')
-- End of VimPlug

-- ColorScheme Start
vim.cmd("colorscheme cyberdream")
require("cyberdream").setup({
	-- Enable transparent background
	transparent = false,

	-- Enable italics comments
	italic_comments = false,

	-- Replace all fillchars with ' ' for the ultimate clean look
	hide_fillchars = false,

	-- Modern borderless telescope theme
	borderless_telescope = true,

	-- Set terminal colors used in `:terminal`
	terminal_colors = true,

	theme = {
		variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
		highlights = {
			-- Highlight groups to override, adding new groups is also possible
			-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

			-- Example:
			Comment = { fg = "#696969", bg = "NONE", italic = true },

			-- Complete list can be found in `lua/cyberdream/theme.lua`
		},

		-- Override a highlight group entirely using the color palette
		overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
			-- Example:
			return {
				Comment = { fg = colors.green, bg = "NONE", italic = true },
				["@property"] = { fg = colors.magenta, bold = true },
			}
		end,

		-- Override a color entirely
		colors = {
			-- For a list of colors see `lua/cyberdream/colours.lua`
			-- Example:
			bg = "#000000",
			green = "#00ff00",
			magenta = "#ff00ff",
		},
	},

	-- Disable or enable colorscheme extensions
	extensions = {
		telescope = true,
		notify = true,
		mini = true,
	},
})
-- End of ColorScheme

-- Treesitter Start
require("nvim-treesitter.configs").setup{
	ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "markdown", "markdown_inline", "javascript", "html", "php", "dart", "python" },
	sync_install = false,
	highlight = {
		enable = true,
	},
	additional_vim_regex_highlighting = false,
}
-- End of Treesitter

-- COC-NVIM Start
-- COC-NVIM Extensions Link: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
-- COC-NVIM Extensions: coc-clangd, coc-lua, coc-html, coc-css(css, scss, less), coc-biome(javascript, typescript, json), coc-svelte, coc-rust-analyzer, coc-pyright,
-- End of COC-NVIM

-- Copilot Start
-- End of Copilot

local cmd = vim.cmd

vim.opt.clipboard="unnamedplus"

cmd("set encoding=utf-8")
cmd("set fileencodings=utf-8,cp949")
cmd("set autoindent")
cmd("set cindent")
cmd("set nu")
cmd("set vb")
cmd("set mouse=a")

cmd("set tabstop=4")
cmd("set shiftwidth=4")
cmd("set softtabstop=0")
cmd("set noexpandtab")

cmd("set laststatus=2")
cmd("set hlsearch")
cmd("set showmatch")
cmd("set smartcase")
cmd("set ruler")
cmd("set incsearch")

cmd("set title")
cmd("set titlestring=%f")

