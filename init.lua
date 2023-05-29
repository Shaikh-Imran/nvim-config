-- for VSCode Nvim
if vim.g.vscode then
	require("settings")
else
	-- ordinary NeoVim
	require("settings")
	require("mappings")
	require("packer-config")
	require("configs.color-scheme")
	require("configs.colorizer")
	require("configs.bufferline")
	require("configs.nvim-tree-config")
	require("configs.lsp")
	require("configs.tree-sitter")
	require("configs.harpoon")
	require("configs.alpha-nvim")
	require("configs.lualine")
	require("configs.completion")
	require("configs.null-ls")
	require("configs.nvim-ts-autotag")
	require("configs.lspsaga")
	require("configs.toggleterm")
end
