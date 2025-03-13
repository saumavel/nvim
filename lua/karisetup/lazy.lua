local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Import all your category folders
	{ import = "karisetup.plugins.development" },
	{ import = "karisetup.plugins.editor" },
	{ import = "karisetup.plugins.git" },
	{ import = "karisetup.plugins.langs" },
	{ import = "karisetup.plugins.lsp" },
	{ import = "karisetup.plugins.navigation" },
	{ import = "karisetup.plugins.tools" },
	{ import = "karisetup.plugins.ui" },
}, {
	default = {
		lazy = true,
	},
	ui = {
		border = "rounded"
	},
	-- rocks = {
	--     hererocks = false
	-- },
	performance = {
		rtp = {
			disable_plugins = {
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"tutor",
			}
		}
	},
})
