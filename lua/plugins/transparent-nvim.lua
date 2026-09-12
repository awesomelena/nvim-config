return {
	"xiyaowong/transparent.nvim",
	lazy = false,
  priority = 900,
	config = function()
		require("transparent").setup({ -- Optional, you don't have to run setup.
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
				"InsertEnter",
			},
			extra_groups = {
				"CursorLine",
				"NormalFloat",
				"TablineFill",
        "FloatBorder",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal",
        "WhichKeyFloat",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
			}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		})

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        require("transparent").clear_prefixed_groups("")
      end,
    })
	end,
}
