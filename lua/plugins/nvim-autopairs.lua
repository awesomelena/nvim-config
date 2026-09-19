local config = function()
	local autopairs = require("nvim-autopairs")

	autopairs.setup({
		check_ts = true, -- treesitter check
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
		},
		fast_wrap = {}, -- <M-e> in insert mode
	})

	autopairs.get_rules("'")[1].not_filetypes = { "vhdl", "verilog", "systemverilog" }

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = config,
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
}
