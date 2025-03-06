return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add          = { text = '┃', count = true },
			change       = { text = '┃', count = true },
			delete       = { text = '_', count = true },
			topdelete    = { text = '‾', count = true },
			changedelete = { text = '~', count = true },
			untracked    = { text = '┆' },
		},
		signs_staged = {
			add          = { text = '┃', count = true },
			change       = { text = '┃', count = true },
			delete       = { text = '_', count = true },
			topdelete    = { text = '‾', count = true },
			changedelete = { text = '~', count = true },
		},
		numhl = false,
		preview_config = {
			border = 'rounded' },
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 0,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
		diff_opts = {
			vertical = false,
		},
		trouble = true,
	}
}
