local colors = require("colors")
local bufferline = require("bufferline")

bufferline.setup {
	options = {
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "thin",
		always_show_bufferline = true,
		custom_filter = function(buf_number)
			-- Func to filter out our managed/persistent split terms
			local present_type, type = pcall(function()
				return vim.api.nvim_buf_get_var(buf_number, "term_type")
			end)

			if present_type then
				if type == "vert" then
					return false
				elseif type == "hori" then
					return false
				else
					return true
				end
			else
				return true
			end
		end,
	},
	highlights = {
		fill = {
			guifg = colors.grey_fg,
			guibg = colors.black,
		},
		background = {
			guifg = colors.grey_fg,
			guibg = colors.black,
		},
		-- buffers
		buffer_visible = {
			guifg = colors.light_grey,
			guibg = colors.bg,
		},
		buffer_selected = {
			guifg = colors.white,
			guibg = colors.bg,
			gui = "bold",
		},
		-- tabs
		tab = {
			guifg = colors.light_grey,
			guibg = colors.bg,
		},
		tab_selected = {
			guifg = colors.black,
			guibg = colors.blue,
		},
		tab_close = {
			guifg = colors.red,
			guibg = colors.black,
		},
		indicator_selected = {
			guifg = colors.bg,
			guibg = colors.blue,
		},
		-- separators
		separator = {
			guifg = colors.bg,
			guibg = colors.bg,
		},
		separator_visible = {
			guifg = colors.bg,
			guibg = colors.bg,
		},
		separator_selected = {
			guifg = colors.black,
			guibg = colors.black,
		},
		-- modified
		modified = {
			guifg = colors.red,
			guibg = colors.bg,
		},
		modified_visible = {
			guifg = colors.red,
			guibg = colors.bg,
		},
		modified_selected = {
			guifg = colors.green,
			guibg = colors.bg,
		},
		-- close buttons

		close_button = {
			guifg = colors.light_grey,
			guibg = colors.black,
		},
		close_button_visible = {
			guifg = colors.light_grey,
			guibg = colors.bg,
		},
		close_button_selected = {
			guifg = colors.red,
			guibg = colors.bg,
		},
	},
}
