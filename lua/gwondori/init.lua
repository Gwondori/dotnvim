-- VimPlug Start
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug("nvim-treesitter/nvim-treesitter", { ['do'] = function()
	vim.call("TSUpdate")
end })
Plug("mfussenegger/nvim-lsp-compl")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("zbirenbaum/copilot.lua")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
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

-- Mason Start
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "bashls", "neocmake", "dockerls", "docker_compose_language_service", "gradle_ls", "biome", "html", "intelephense", "perlnavigator", "pyright", "sqlls", "yamlls", "taplo" },
}
require("lspconfig").pyright.setup{}
-- End of Mason

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

-- Auto Complete Start
local cmp = require("cmp")  -- Set up nvim-cmp.

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}

require('lspconfig')['biome'].setup {
	capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
	capabilities = capabilities
}
-- End of Auto Complete

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

