------------------------------------------------------
-- Define keyMaps of NeoVim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

set("i", "jk", "<Esc>")
-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>")
vim.opt.pastetoggle = "<F2>"

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>")

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>Q", ":qa!<CR>")

-- Move lines up and down in Visual mode
map("v", "J", "m: '>+1<CR>gv=gv") -- Not Working

-- Move Up and down a page
map("n", "<C-u>", "<C-u>zz") -- up
map("n", "<C-d>", "<C-d>zz") -- down

-- copy over without overriding
map("x", "<leader>p", '"_dp')

-- close current buffer
map("n", "<C-b>", ":Bdelete<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Nvim Tree
map("n", "<leader>ee", ":NvimTreeToggle<CR>", opts) -- toogle Explorer
map("n", "<leader>ef", ":NvimTreeFocus<CR>", opts) -- toogle Explorer
map("n", "<leader>ec", ":NvimTreeFindFile<CR>", opts) -- toogle Explorer

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<leader>pf", builtin.find_files, {})
set("n", "<C-p>", builtin.git_files, {})
set("n", "<leader>ps", builtin.live_grep, {})
set("n", "<leader>pb", builtin.buffers, {})

-- Fotmatting
set("n", "<C-L>", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>")

-- Harpoon Setting
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

set("n", "<leader>a", mark.add_file)
set("n", "<C-e>", ui.toggle_quick_menu)

set("n", "<C-1>", function()
	ui.nav_file(1)
end)
set("n", "<C-2>", function()
	ui.nav_file(2)
end)
set("n", "<C-3>", function()
	ui.nav_file(3)
end)
set("n", "<C-4>", function()
	ui.nav_file(4)
end)

-- Undo Tree
set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- git status
set("n", "<leader>gs", vim.cmd.Git)

-- Trouble Nvim Setup for list of errors
set("n", "<leader>xx", "<cmd>TroubleToggle<cr>") -- toggle error list

-- BufferLine
set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

-- LSP Saga
set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- code action
set("n", "<C-N>", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- next warn/error/hint etc
set("n", "<C-P>", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- next warn/error/hint etc
set("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show doc popup
set("n", "gd", "<cmd>Lspsaga finder<CR>") -- definition and where it has been used (references)
set("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>") --
set("n", "gp", "<cmd>Lspsaga peek_definition<CR>") -- popup of definition code (q to quit)
set("n", "gt", "<cmd>Lspsaga goto_definition<CR>") --  jump to the definition
set("n", "gr", "<cmd>Lspsaga rename<CR>") -- rename to affect all references

-- Hop Nvim

-- place this in one of your configuration file(s)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "<leader>f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, { remap = true })
