-- add list of plugins to install
return require("packer").startup(function()
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("ellisonleao/gruvbox.nvim") --> gruvbox colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" }) --> catppuccin colorscheme
	use("shaunsingh/nord.nvim") --> nord colorscheme

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- COC.NVIM
	use({ "neoclide/coc.nvim", branch = "release" })

	-- compitest nvim
	use({
		"xeluxee/competitest.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
	})

	-- Leetbuddy
	use({
		"Dhanus3133/LeetBuddy.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } },
	})

	-- GITHUB COPILOT
	use("github/copilot.vim")

	-- Toggle Terminals
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- bufferline
	use("akinsho/bufferline.nvim")

	-- discord
	use("andweeb/presence.nvim")

	-- scrollbar
	use("petertriho/nvim-scrollbar")

	-- which-key
	use("folke/which-key.nvim")

	-- true zen
	use("Pocco81/true-zen.nvim")

	-- dashboard
	use("glepnir/dashboard-nvim")

	-- aerial
	use("stevearc/aerial.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	--use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	--use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	--use("neovim/nvim-lspconfig") -- easily configure language servers
	--use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	--use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	--use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("p00f/nvim-ts-rainbow")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- dashboard nvim
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
end)
