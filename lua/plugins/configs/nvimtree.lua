local function open_nvim_tree(data)
	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if not real_file and not no_name then
		return
	end
	-- open the tree, find the file but don't focus it
	require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- NvimTree Config Start
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
		side = "left",
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
-- End of NvimTree

local map = vim.api.nvim_set_keymap

-- NvimTree Keymaps
map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

