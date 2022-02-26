local ts_config = require("nvim-treesitter.configs")
local colors = require("colors")

ts_config.setup {
	ensure_installed = {
		"javascript",
		"html",
		"css",
		"bash",
		"lua",
		"json",
		"python"
	},
	highlight = {
		enable = false,
		use_languagetree = true
	},
}
