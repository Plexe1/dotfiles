local builtin = require("telescope.builtin")

-- ======================================
-- LSP Keymaps (buffer-local)
-- ======================================

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(event)
    local buf = event.buf
    local opts = { buffer = buf, noremap = true, silent = true }

    -- LSP actions
    vim.keymap.set(
      "n",
      "<leader>a",
      vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, { desc = "Code action" })
    )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
    vim.keymap.set(
      "n",
      "<leader>lw",
      vim.lsp.buf.workspace_symbol,
      vim.tbl_extend("force", opts, { desc = "Workspace symbol" })
    )
    vim.keymap.set(
      "n",
      "<leader>ld",
      vim.diagnostic.open_float,
      vim.tbl_extend("force", opts, { desc = "Open diagnostic float" })
    )

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set(
      "n",
      "gl",
      vim.diagnostic.open_float,
      vim.tbl_extend("force", opts, { desc = "Open diagnostic float" })
    )
    vim.keymap.set(
      "n",
      "[",
      vim.diagnostic.goto_prev,
      vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" })
    )
    vim.keymap.set(
      "n",
      "]",
      vim.diagnostic.goto_next,
      vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" })
    )

    -- Hover
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show hover information" }))

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = event.data.client_id })
      end,
    })
  end,
})

-- ======================================
-- Non-LSP Keymaps (global)
-- ======================================

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Half page down and center" }))
vim.keymap.set("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Half page up and center" }))
vim.keymap.set("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join lines and keep cursor position" }))
vim.keymap.set("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result and center" }))
vim.keymap.set("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result and center" }))
vim.keymap.set("n", "Q", "<nop>", vim.tbl_extend("force", opts, { desc = "Disable Ex mode" }))

vim.keymap.set(
  "n",
  "<leader>/",
  "<Plug>(comment_toggle_linewise_current)",
  vim.tbl_extend("force", opts, { desc = "Toggle comment" })
)
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, vim.tbl_extend("force", opts, { desc = "Open file explorer" }))
vim.keymap.set("n", "<leader>p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste without overwrite" }))
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  vim.tbl_extend("force", opts, { desc = "Search and replace word under cursor" })
)

-- ======================================
-- Telescope (Find) Mappings
-- ======================================
vim.keymap.set("n", "<leader>ff", builtin.find_files, vim.tbl_extend("force", opts, { desc = "Find files" }))

vim.keymap.set("n", "<leader>fg", builtin.git_files, vim.tbl_extend("force", opts, { desc = "Find git files" }))
vim.keymap.set("n", "<leader>fl", builtin.live_grep, vim.tbl_extend("force", opts, { desc = "Live grep" }))

-- Find buffers via semicolon
vim.keymap.set("n", ";", builtin.buffers, vim.tbl_extend("force", opts, { desc = "Find buffers" }))

-- ======================================
-- Visual Mode Mappings
-- ======================================

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection down" }))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move selection up" }))
vim.keymap.set(
  "v",
  "<leader>/",
  "<Plug>(comment_toggle_linewise_visual)",
  vim.tbl_extend("force", opts, { desc = "Toggle comment" })
)

-- ======================================
-- Misc
-- ======================================

-- Insert mode fixes
vim.keymap.set("i", "<Right>", "<Right>", { noremap = true })

-- Colorscheme hooks
local colorscheme_hooks = require("plexe1.colorscheme_hooks")

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("MyColorschemeHooks", { clear = true }),
  callback = function()
    colorscheme_hooks.apply_custom_highlights()
  end,
})
