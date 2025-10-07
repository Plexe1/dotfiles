local which_key = require("which-key")
local builtin = require("telescope.builtin")

-- ======================================
-- LSP Keymaps (buffer-local)
-- ======================================

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(event)
    local buf = event.buf

    local mappings = {
      -- Group header for LSP
      { "<leader>l", group = "LSP", buffer = buf },

      -- LSP actions
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code action", buffer = buf },
      { "<leader>lr", vim.lsp.buf.references, desc = "References", buffer = buf },
      { "<leader>ln", vim.lsp.buf.rename, desc = "Rename", buffer = buf },
      { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol", buffer = buf },
      { "<leader>ld", vim.diagnostic.open_float, desc = "Open diagnostic float", buffer = buf },

      -- Navigation
      { "gd", vim.lsp.buf.definition, desc = "Go to definition", buffer = buf },
      { "gl", vim.diagnostic.open_float, desc = "Open diagnostic float", buffer = buf },
      { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic", buffer = buf },
      { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic", buffer = buf },

      -- Hover
      { "K", vim.lsp.buf.hover, desc = "Show hover information", buffer = buf },
    }

    which_key.add(mappings)

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

which_key.add({
  { "<C-d>", "<C-d>zz", desc = "Half page down and center" },
  { "<C-u>", "<C-u>zz", desc = "Half page up and center" },
  { "J", "mzJ`z", desc = "Join lines and keep cursor position" },
  { "n", "nzzzv", desc = "Next search result and center" },
  { "N", "Nzzzv", desc = "Previous search result and center" },
  { "Q", "<nop>", desc = "Disable Ex mode" },

  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle comment" },
  { "<leader>e", vim.cmd.Ex, desc = "Open file explorer" },
  { "<leader>p", '"_dP', desc = "Paste without overwrite" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
})

-- ======================================
-- Telescope (Find) Mappings
-- ======================================

which_key.add({
  { "<leader>f", group = "Find" },
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  { "<leader>fg", builtin.git_files, desc = "Find git files" },
  { "<leader>fl", builtin.live_grep, desc = "Live grep" },
})

-- Find buffers via semicolon
which_key.add({
  { ";", builtin.buffers, desc = "Find buffers" },
})

-- ======================================
-- Visual Mode Mappings
-- ======================================

which_key.add({
  mode = { "v" },
  { "J", ":m '>+1<CR>gv=gv", desc = "Move selection down" },
  { "K", ":m '<-2<CR>gv=gv", desc = "Move selection up" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle comment" },
})

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

