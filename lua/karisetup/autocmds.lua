local autocmd = vim.api.nvim_create_autocmd

-- leyfa að loka fleiri gluggum með q
autocmd("FileType", {
    pattern = {
        "git",
        "dap-float",
        "startuptime",
        "query", -- ekki viss hvað þetta er
        "help",
        "lspinfo",
        "notify",
        "man",
        "qf",
        "floaterm"
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = event.buf, silent = true }) -- breytti úr close í quit svo man geti hætt
    end,
    desc = "Close certain windows with q",
})

-- Ekki commenta á nýar línur
autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
    desc = "Disable new line comment",
})

-- fyrir vimtex
-- local au_group = vim.api.nvim_create_augroup("vimtex_events", {}),

-- Cleanup on quit
autocmd("User", {
    pattern = "VimtexEventQuit",
    command = "VimtexClean",
    desc = "Clean folder on vimtex exit"
})
