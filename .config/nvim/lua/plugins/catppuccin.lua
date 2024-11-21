return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {},
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					all = {
						base = "#15222e",
						mantle = "#101e2a",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
