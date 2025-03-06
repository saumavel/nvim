return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>i",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "Format buffer with conform",
        },
    },

    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            -- lua = { "stylua" },
            -- python = { "isort", "black" },
            -- javascript = { { "prettierd", "prettier" } },
        },
        -- Set up format-on-save
        -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
        -- Customize formatters
        formatters = {
            -- shfmt = {
            --     prepend_args = { "-i", "2" },
            -- },
            findent = {
                prepend_args = {"-i4"}
            },
        },
    }
}
