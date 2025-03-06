return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "tectonic"

        -- Aðlaga að lua og nota sioyek í windows
        -- if has('win32') || (has('unix') && exists('$WSLENV'))
        --   if executable('sioyek.exe')
        --     let g:vimtex_view_method = 'sioyek'
        --     let g:vimtex_view_sioyek_exe = 'sioyek.exe'
        --     let g:vimtex_callback_progpath = 'wsl nvim'
        --   elseif executable('mupdf.exe')
        --     let g:vimtex_view_general_viewer = 'mupdf.exe'
        --   elseif executable('SumatraPDF.exe')
        --     let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
        --   endif
        -- endif
    end
}
