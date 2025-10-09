return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-mini/mini.icons",
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- silence startup messages
		notify = false,

		plugins = {
			marks = false,
			registers = false,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},

		-- key label replacements
		replace = {
			-- ["<space>"] = "SPC",
			-- ["<cr>"] = "RET",
			-- ["<tab>"] = "TAB",
		},

		-- operator descriptions
		defer = { gc = "Comments" },

		-- popup scrolling
		keys = {
			scroll_down = "<c-d>",
			scroll_up = "<c-u>",
		},

		-- popup window style
		win = {
			border = "single",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 2, 2, 2, 2 },
			winblend = 0,
		},

		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},

		ignore_missing = false,
		show_help = true,
		show_keys = true,

		-- ✅ modern triggers syntax
  -- just "auto" or a list; no auto/blacklist keys
  triggers = "auto",

  disable = {
	  buftypes = {},
	  filetypes = { "TelescopePrompt" },
  },  },}
