return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		workspaces = {
			{
				name = "skolinn",
				path = "~/skolinn/obsidian_haust_25/haust_25/",
			},
			-- {
			-- 	name = "work",
			-- 	path = "~/vaults/work",
			-- },
		},

		ui = {
			enable = false, -- 🔴 Add this to disable the UI and avoid conflicts
		},

		completion = {
			nvim_cmp = true, -- if using nvim-cmp
			min_chars = 2,
		},

		mappings = {
			-- These are the default mappings, feel free to tweak them!
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},

		daily_notes = {
			folder = "dailies",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			template = nil, -- You can point this to a template file like "templates/daily.md"
		},

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},

		attachments = {
			img_folder = "assets/images",
			-- This sets the default behavior for how files are named when copied into the vault:
			img_text_func = function()
				return os.date("%Y-%m-%d-%H%M%S")
			end,
		},

		note_id_func = function(title)
			-- Auto-generate note IDs
			return title:gsub(" ", "-"):lower()
		end,
	},
}
