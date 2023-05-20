------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Nvim Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts) -- toogle Explorer

-- Telescope
local builtin = require('telescope.builtin')
set('n', '<leader>pf', builtin.find_files, {})
set('n', '<C-p>', builtin.git_files, {})
set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Fotmatting
set('n', '<C-L>', ":lua vim.lsp.buf.format()<CR>")

-- Harpoon Setting
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

set('n', '<leader>a', mark.add_file)
set('n', '<C-e>', ui.toggle_quick_menu)

set('n', '<C-1>', function() ui.nav_file(1) end)
set('n', '<C-2>', function() ui.nav_file(2) end)
set('n', '<C-3>', function() ui.nav_file(3) end)
set('n', '<C-4>', function() ui.nav_file(4) end)

-- Undo Tree
set('n', '<leader>u', vim.cmd.UndotreeToggle)


-- git status
set('n', '<leader>gs', vim.cmd.Git)

-- Trouble Nvim Seup for list of errors
set("n", "<leader>xx", "<cmd>TroubleToggle<cr>") -- toggle error list
