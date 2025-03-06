return {
    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "racket", "scheme" },
        lazy = true,
        init = function()
            -- Set configuration options here
            -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
            -- This is VERY helpful when reporting an issue with the project
            -- vim.g["conjure#debug"] = true
            vim.g["conjure#client_on_load"] = false
            vim.g["conjure#log#hud#border"] = "rounded"
            vim.g["vim.g:conjure#log#hud#ignore_low_priority"] = true
            vim.g["conjure#mapping#doc_word"] = false
            vim.g["listp_rainbow"] = true
        end,
    },
    {
        "dundalek/parpar.nvim",
        ft = { "clojure", "fennel", "python", "racket", "scheme" },
        lazy = true,
        dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
        opts = {}
    }
}
