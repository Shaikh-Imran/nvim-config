vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		separator_style = "slant",
		show_close_icon = true,
		buffer_close_icon = "󰅖",
		show_buffer_close_icons = true,
		right_mouse_command = "bdelete! %d",
		color_icon = true,
		show__buffer_icons = true,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
	highlights = {
		separator = {
			guifg = "#073642",
			guibg = "#002b36",
		},
		separator_selected = {
			guifg = "#073642",
		},
		background = {
			guifg = "#0657b83",
			guibg = "#002b36",
		},
		buffer_selected = {
			guifg = "#fdf6e3",
			gui = "bold",
		},
		fill = {
			guidbg = "#073642",
		},
	},
})
