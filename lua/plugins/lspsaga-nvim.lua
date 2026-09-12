return {
	"nvimdev/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			finder = {
				keys = {
					toggle_or_open = "<CR>",
				},
			},
			definition = {
				keys = {
					edit = "<CR>",
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
