local wk = require("which-key")
wk.add({
	{ "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
})

wk.add({
	{ "<leader>f", group = "Find" },
})

wk.add({
	{ "<leader>t",  group = "Terminal" },
	{ "<leader>tc", "<cmd>:FloatermNew --autoclose=0 gcc % -o %< && ./%<<cr>", desc = "Run C code" },
})

wk.add({
	{ "<leader>d",  group = "Diagnostics" },
	{ "<leader>dT", "<cmd>TodoTrouble<cr>",                    desc = "open Todo comments in Trouble" },
	{ "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "go to next diagnostic" },
	{ "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "go to previous diagnostic" },
})

wk.add({
	{ "s", group = "Surround" }
})

wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
})

wk.add({
	{ "<leader>.",          group = "Settings" },
	{ "<leader>.s", "<cmd>nohlsearch<cr>", desc = "hide search highlight" },
})
