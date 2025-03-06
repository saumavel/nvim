return {
	'nvim-treesitter/nvim-treesitter',
	cond = false,
	build = ':TSUpdate',
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust",
				"python", "bash", "fish", "markdown", "markdown_inline", "latex",
				"make", "nix", "regex", "cpp",
				"html", "css", "json", "sql"},
			sync_install = false,
			highlight = { enable = true },
			indent = {
				enable = true,
			},

		})
	end
}
