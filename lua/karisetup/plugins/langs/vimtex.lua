return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	init = function()
		-- Use your zathura-nix wrapper script
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_general_viewer = vim.fn.expand('~/.local/bin/zathura-nix')

		-- This is the correct syntax for macOS
		vim.g.vimtex_view_zathura_options =
		"-x \"nvim --headless -c \\\"VimtexInverseSearch %{line} %{input}\\\"\" %{input}"

		-- Use tectonic for compilation (which you already have installed via Nix)
		vim.g.vimtex_compiler_method = "tectonic"

		-- Additional Mac-specific settings
		vim.g.vimtex_quickfix_mode = 0 -- Don't open quickfix window automatically
		vim.g.vimtex_compiler_progname = 'nvim'

		-- Optional: Set a callback for successful compilation
		vim.g.vimtex_compiler_callback_hooks = { 'UpdateSkim' }

		-- Only use Windows/WSL config if actually on those platforms
		if vim.fn.has('win32') == 1 or (vim.fn.has('unix') == 1 and vim.fn.exists('$WSLENV') == 1) then
			-- Windows/WSL specific configuration...
		end
	end
}
