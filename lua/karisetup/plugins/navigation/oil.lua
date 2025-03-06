return {
	'stevearc/oil.nvim',
	keys = {
		{ "<leader>e", "<CMD>Oil<CR>", desc = 'Open Oil' }
	},
	opts = {
		-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
		-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
		default_file_explorer = true,


		-- Id is automatically added at the beginning, and name at the end
		-- See :help oil-columns
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
		skip_confirm_for_simple_edits = true,

		-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
		-- (:help prompt_save_on_select_new_entry)
		prompt_save_on_select_new_entry = true,

		-- Constrain the cursor to the editable parts of the oil buffer
		-- Set to `false` to disable, or "name" to keep it on the file names
		constrain_cursor = "editable",

		-- Set to true to watch the filesystem for changes and reload oil
		watch_for_changes = true,


		keymaps = {
			["g?"] = "actions.show_help",
			["l"] = "actions.select",
			["<Cr>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
			["<C-v>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-l>"] = "actions.refresh",
			["h"] = "actions.parent",
			["-"] = "actions.open_cwd",
			["~"] = "actions.cd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
			-- ["<leader>ff"] = {
			-- 	function()
			-- 		require("telescope.builtin").find_files({
			-- 			cwd = require("oil").get_current_dir()
			-- 		})
			-- 	end,
			-- 	mode = "n",
			-- 	nowait = true,
			-- 	desc = "Find files in the current directory"
			-- },
			-- ["<leader>fg"] = {
			-- 	function()
			-- 		require("telescope.builtin").live_grep({
			-- 			cwd = require("oil").get_current_dir()
			-- 		})
			-- 	end,
			-- 	mode = "n",
			-- 	nowait = true,
			-- 	desc = "Grep in the current directory"
			-- }
			["<leader>ff"] = {
				function()
					require("fzf-lua").files({
						cwd = require("oil").get_current_dir()
					})
				end,
				mode = "n",
				nowait = true,
				desc = "Find files in the current directory"
			},
			["<leader>fj"] = {
				function()
					require("fzf-lua").live_grep({
						cwd = require("oil").get_current_dir()
					})
				end,
				mode = "n",
				nowait = true,
				desc = "Grep in the current directory"
			}
		},
		use_default_keymaps = false,

		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true
		},
	},
}
