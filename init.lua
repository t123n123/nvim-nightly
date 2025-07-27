vim.o.number = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"
vim.o.winborder = "rounded"
vim.o.sw = 4
vim.o.ts = 4
vim.o.expandtab = true
vim.o.completeopt = "noselect,noinsert,menu,menuone,popup,fuzzy" -- completion menu
vim.o.pumheight = 10                                             -- max completion height
vim.g.havenerdfont = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.signcolumn = "yes"
vim.o.confirm = true
vim.o.updatetime = 200
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.shiftround = true
vim.o.undofile = true
vim.o.undolevels = 10000
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<space>")
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.g.netrw_banner = 0
vim.o.splitright = true

local kb = vim.keymap.set
kb('n', "<leader>o", ":update<CR>:source<CR>")
kb('n', "<leader>w", ":write<cr>")

vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/LuaLS/lua-language-server" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/folke/snacks.nvim" },
})


vim.cmd [[colorscheme carbonfox]]
require("mason").setup()
require("oil").setup({ columns = { "icon" } })
require("mini.pick").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.align").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.completion").setup()
require("mini.statusline").setup()
require("mini.starter").setup()
require("mini.indentscope").setup()
require("mini.icons").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()
require("mini.trailspace").setup()
require("mini.bracketed").setup()
require("mini.basics").setup()

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },
        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})

require("snacks").setup({
    bigfile = { enabled = true },
    words = { enabled = true },
    notifier = { enabled = true },

})

vim.cmd [[set completeopt+=noselect]]

vim.lsp.enable({ "lua_ls", "clangd", "tinymist" })

kb('n', "<leader>gf", vim.lsp.buf.format)
kb('n', "<leader>f", ":Pick files<cr>")
kb('n', "<leader>e", ":Oil<cr>")
kb('n', "<leader>h", ":Pick help<cr>")
kb('n', "<leader>/", Snacks.picker.grep)
kb('n', "<leader><leader>", Snacks.picker.buffers)
kb({ 'n', 'v', 't' }, "<M-t>", function() Snacks.terminal() end)
kb('n', "<leader>g", function() Snacks.lazygit() end)
kb('n', "gd", function() Snacks.picker.lsp_definitions() end)
kb('n', "gD", function() Snacks.picker.lsp_declarations() end)
kb('n', "gr", function() Snacks.picker.lsp_references() end)
kb('n', "gI", function() Snacks.picker.lsp_implementations() end)
kb('n', "gy", function() Snacks.picker.lsp_type_definitions() end)
kb('n', "<leader>ss", function() Snacks.picker.lsp_symbols() end)
kb('n', "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end)
kb('n', "<M-n>", ":cnext<cr>")
kb('n', "<M-m>", ":cprev<cr>")
