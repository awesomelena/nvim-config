local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	vim.diagnostic.config({
		virtual_text = {
			prefix = "■",
			source = "always",
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- global default capabilities
	vim.lsp.config("*", {
		capabilities = cmp_nvim_lsp.default_capabilities(),
	})

	-- global on_attach
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			require("util.lsp").on_attach(client, args.buf)
		end,
	})

	-- lua
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
					checkThirdParty = false,
				},
			},
		},
	})

	-- json
	vim.lsp.config("jsonls", {
		filetypes = { "json", "jsonc" },
	})

	-- python
	vim.lsp.config("pyright", {
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- typescript
	vim.lsp.config("ts_ls", {
		filetypes = {
			"typescript",
		},
		root_markers = { "package.json", "tsconfig.json", ".git" },
	})

	-- bash
	vim.lsp.config("bashls", {
		filetypes = { "sh" },
	})

	-- solidity
	vim.lsp.config("solidity", {
		filetypes = { "solidity" },
	})

	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	vim.lsp.config("emmet_ls", {
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
		},
	})

	-- java
	vim.lsp.config("jdtls", {})

	-- c/c++
	vim.lsp.config("clangd", {})

	-- go
	vim.lsp.config("gopls", {})

	-- asm
	vim.lsp.config("asm_lsp", {
		filetypes = { "asm", "vasm", "s" },
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettierd = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local alex = require("efmls-configs.linters.alex")
	local solhint = require("efmls-configs.linters.solhint")

	-- configure efm server
	vim.lsp.config("efm", {
		filetypes = {
			"lua",
			"python",
			"json",
			"jsonc",
			"sh",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
			"markdown",
			"solidity",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint_d, prettierd },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				sh = { shellcheck, shfmt },
				javascript = { eslint_d, prettierd },
				javascriptreact = { eslint_d, prettierd },
				typescriptreact = { eslint_d, prettierd },
				svelte = { eslint_d, prettierd },
				vue = { eslint_d, prettierd },
				markdown = { alex, prettierd },
				solidity = { solhint },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"folke/lazydev.nvim",
		"windwp/nvim-autopairs",
		"mason-org/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
