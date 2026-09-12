local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"ts_ls",
		"solidity",
		"tailwindcss",
		"pyright",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
		"jsonls",
    "jdtls",
    "clangd",
    "gopls",
	},

	automatic_enable = true,
}

return {
	"mason-org/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
}
