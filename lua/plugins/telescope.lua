local keymap = vim.keymap

local config = function()
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      find_buffers = {
        theme = "dropdown",
        previewer = false,
      },
    },
  })
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Telescope keymaps" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
	},
}
