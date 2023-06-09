return require("packer").startup(function(use)
	-- Packer Plugin
	use("wbthomason/packer.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- File / Project Explorer
	-- NVIM Tree
	use("nvim-tree/nvim-tree.lua")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- harpoon for recent files
	use("theprimeagen/harpoon")

	-- File Explorer End

	-- Theming Start
	-- color scheme
	use("EdenEast/nightfox.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Bufferline or tabs
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use({
		"famiu/bufdelete.nvim",
		config = function()
			require("bufdelete")
		end,
	})

	-- lua line
	use("nvim-lualine/lualine.nvim")

	-- Color string colorizer: Hex, RGB
	use("norcalli/nvim-colorizer.lua")

	-- Theming end

	-- TreeSitter
	use("nvim-treesitter/nvim-treesitter")

	-- LSP COnfiguration with lSP Zero
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required

			--Snippet
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },

			-- Error list
			{ "folke/trouble.nvim" },
		},
	})

	-- lsp saga for a better LSP UI
	use("glepnir/lspsaga.nvim")

	-- Editors

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- Auto Pair for generating closing bracket
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("windwp/nvim-ts-autotag")

	-- surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Git Changes indicator in editor
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Indent Lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Toogle comments
	use("tpope/vim-commentary")

	-- Formatting
	use("jay-babu/mason-null-ls.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Misc
	-- undo tree for histoy of changes
	use("mbbill/undotree")

	-- Dashboard (start screen)
	use("goolord/alpha-nvim")

	-- Git Helper
	use("tpope/vim-fugitive")

	-- Floating Terminal
	use("akinsho/toggleterm.nvim")

	-- key mapping UI
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})
end)
