-- Treesitter Config Start
require("nvim-treesitter.configs").setup{
	ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "markdown", "markdown_inline", "javascript", "html", "php", "dart", "python", "svelte", "css", "csv", "cuda", "go", "typescript", "scss", "rust" },
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	additional_vim_regex_highlighting = false,
}
-- End of Treesitter
