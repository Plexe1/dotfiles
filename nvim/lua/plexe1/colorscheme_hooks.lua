local M = {}

function M.apply_custom_highlights()
	-- if vim.o.background == "dark" then
	-- 	vim.api.nvim_set_hl(0, "MyCustomGroup", { fg = "#e06c75", bg = "#282c34" })
	-- else
	-- 	vim.api.nvim_set_hl(0, "MyCustomGroup", { fg = "#e06c75", bg = "#ffffff" })
	-- end
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

return M
