-- Til að vim opni nýa glugga undir og til hægri
vim.opt.splitbelow = true
vim.opt.splitright = true

-- notar ignore case nema það sé stór í leitarorði
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Láta nvim ripgrep nota smartcase
vim.opt.grepprg = "rg --vimgrep -uu --smart-case"

-- setja linenumber og relative ln
vim.opt.nu = true
vim.opt.relativenumber = true

-- hafa allt sem 4 space = tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false -- breytir tab í spaces, hafa false því ruglar í makefile
vim.opt.smarttab = true

-- setja lítinn split glugga sem sýnir substitute dótið
vim.opt.inccommand = "split"

-- Fyrir undotree plugin svo það muni lengi fra primeagen
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- https://www.reddit.com/r/vim/comments/jqogan/how_does_a_lower_updatetime_lead_to_better/
vim.opt.updatetime = 2000

vim.opt.lazyredraw = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 999

vim.opt.splitkeep = 'cursor'

-- wrap á góðum stað
vim.opt.linebreak = true

-- leyfir að færast lengra en lína í visual block mode
vim.opt.virtualedit = "block"

-- sign column til að hann sé ekki alltaf að færast ef diag
vim.opt.signcolumn = "yes:1"

-- diagnostic signs
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰯈', --'󰚌', --󰅚 󰯈
            [vim.diagnostic.severity.WARN] = '', --'󰀪', --' ', --󰀪
            [vim.diagnostic.severity.HINT] = '',--'󱠂 ', --󰌶
            [vim.diagnostic.severity.INFO] ='', --' ',
        },
        -- linehl = {
        -- },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
        },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'if_many',
        header = '',
        prefix = '',
    },
})

vim.opt.list = false -- enable or disable listchars
vim.opt.listchars = {
    eol = "↲",
    tab = "-->",
    trail = "+",
    extends = ">",
    precedes = "<",
    space = "·",
    nbsp = "␣",
}

-- Tells me if there is the line is wrapped
-- vim.g.showbreak = '↪' --NOTE: virðist ekki virka
