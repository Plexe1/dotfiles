require("conform").setup({
	-- Map of filetype to formatters
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
		-- You can also customize some of the format options for the filetype
		rust = { "rustfmt" },
		-- You can use a function here to determine the formatters dynamically
		python = { "ruff" }, -- Use the "*" filetype to run formatters on all filetypes.
	},
	-- Set this to change the default values when calling conform.format()
	-- This will also affect the default values for format_on_save/format_after_save
	default_format_opts = {
		lsp_format = "fallback",
	},
	-- If this is set, Conform will run the formatter on save.
	-- It will pass the table to conform.format().
	-- This can also be a function that returns the table.
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
