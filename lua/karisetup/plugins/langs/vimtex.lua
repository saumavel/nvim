return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	init = function()
		-- 1. Fix the Zathura issue - update the path or method
		-- If you're using a custom zathura-nix script, make sure it's executable
		-- and in the correct path
		vim.g.vimtex_view_method = "zathura"

		-- Check if the custom script exists and is executable
		local zathura_path = vim.fn.expand('~/.local/bin/zathura-nix')
		if vim.fn.executable(zathura_path) == 1 then
			vim.g.vimtex_view_general_viewer = zathura_path
		else
			-- Fallback to system zathura if available, or another viewer
			if vim.fn.executable('zathura') == 1 then
				vim.g.vimtex_view_general_viewer = 'zathura'
			else
				-- Consider using another viewer if zathura isn't available
				-- vim.g.vimtex_view_method = "skim"  -- for macOS
				-- vim.g.vimtex_view_method = "general"
				-- vim.g.vimtex_view_general_viewer = "okular"
			end
		end

		-- This is the correct syntax for macOS
		vim.g.vimtex_view_zathura_options =
		"-x \"nvim --headless -c \\\"VimtexInverseSearch %{line} %{input}\\\"\" %{input}"

		-- 2. Use tectonic for compilation (which you already have installed via Nix)
		vim.g.vimtex_compiler_method = "tectonic"

		-- 3. Additional Mac-specific settings
		vim.g.vimtex_quickfix_mode = 0 -- Don't open quickfix window automatically
		vim.g.vimtex_compiler_progname = 'nvim'

		-- 4. Only use Windows/WSL config if actually on those platforms
		if vim.fn.has('win32') == 1 or (vim.fn.has('unix') == 1 and vim.fn.exists('$WSLENV') == 1) then
			-- Windows/WSL specific configuration...
		end

		-- 5. Fix the deprecated callback hooks
		-- Create autocmd for the callback instead of using the deprecated option
		vim.api.nvim_create_autocmd('User', {
			pattern = 'VimtexEventCompileSuccess',
			callback = function()
				-- Your UpdateSkim function or other callback logic
				if _G.UpdateSkim then
					_G.UpdateSkim()
				end
			end,
			group = vim.api.nvim_create_augroup('vimtex_callbacks', { clear = true })
		})

		-- 6. Optional: Display a message about missing dependencies
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.executable('bibtex') == 0 then
					vim.notify("bibtex is not installed. Citation completions may not work.", vim.log.levels.WARN)
				end

				if vim.fn.executable('biber') == 0 then
					vim.notify("biber is not installed. Some bibliography features may not work.", vim.log.levels.WARN)
				end

				if vim.fn.executable('xdotool') == 0 and vim.g.vimtex_view_method == "zathura" then
					vim.notify("xdotool is not installed. Forward search in Zathura will not work.", vim.log.levels.WARN)
				end
			end,
			group = vim.api.nvim_create_augroup("vimtex_dependency_check", { clear = true }),
			once = true
		})
	end,
	-- 7. Add dependencies to ensure the required tools are available
	dependencies = {
		-- You can optionally add dependencies here if you're using a plugin manager
		-- that can install system dependencies
	}
}
