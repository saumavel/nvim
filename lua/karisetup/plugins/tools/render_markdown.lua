return {
	'MeanderingProgrammer/render-markdown.nvim',
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	ft = { "markdown" },
	opts = {
		heading = {
			position = 'inline',
			sign = false,
			-- width = 'block',
			-- left_margin = 0.5,
			-- left_pad = 0.2,
			-- right_pad = 0.2,
		},
		code = {
			sign = false,
			width = 'block',
			left_margin = 0.5,
			left_pad = 0.02,
			right_pad = 0.02,
			language_pad = 0.01,
			min_width = 60,
		},
		checkbox = {
			checked = { scope_highlight = '@markup.strikethrough' }, --TODO: bæta við þema
		},
	},
}
