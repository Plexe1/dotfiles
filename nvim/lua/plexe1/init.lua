vim.g.mapleader = " "

require("plexe1.lazy_init")
require("plexe1.remap")
require("plexe1.set")

local colorscheme_hooks = require("plexe1.colorscheme_hooks")
colorscheme_hooks.apply_custom_highlights()
