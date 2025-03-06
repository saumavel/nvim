return {
	"OXY2DEV/markview.nvim",
	cond = false,
	lazy = true,  -- false Recommended
	ft = "markdown", -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		'echasnovski/mini.icons'
	},
	config = function()
		local presets = require("markview.presets");

		require("markview").setup({
			checkboxes = presets.checkboxes.nerd,
			headings = presets.headings.marker
		});
		require("markview.extras.checkboxes").setup({
			--- When true, list item markers will
			--- be removed.
			remove_markers = false,

			--- If false, running the command on
			--- visual mode doesn't change the
			--- mode.
			exit = false,

			default_marker = "-",
			default_state = "X",

			--- A list of states
			states = {
				{ " ", "X" },
				{ "-", "o", "~" }
			}
		});
	end

}
