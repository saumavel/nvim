return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })
        vim.g.undotree_SplitWidth = 40
        vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_WindowLayout = 2
    end,
}
