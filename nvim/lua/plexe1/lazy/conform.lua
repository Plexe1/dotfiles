return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- Map of filetype to formatters
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			asm = { "asmfmt" },
			cmake = { "cmake_format" },
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			python = { "ruff" },
			json = { "prettier" },
			jsonc = { "prettier" },
			bash = { "shfmt" },
			sh = { "shfmt" },
			zsh = { "shfmt" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			sql = { "sqlfmt" },
			php = { "phpcbf" },
			java = { "google_java_format" },
			nginx = { "nginx-config-formatter" },
			["*"] = { "trim_whitespace" },
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
	},
}
