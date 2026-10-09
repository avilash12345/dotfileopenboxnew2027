vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local map = vim.keymap.set

vim.pack.add({
  { src = "https://github.com/olimorris/onedarkpro.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/Mofiqul/dracula.nvim" },
  { src = "https://github.com/catppuccin/nvim",                        name = "catppuccin" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/saghen/blink.cmp",                       version = vim.version.range("^1") },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/zbirenbaum/copilot.lua" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = 'https://forge.barrettruth.com/barrettruth/live-server.nvim' },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/numToStr/Comment.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
})

--require("tokyonight").setup({
--  transparent = false,
--  style = {
--    sidebars = "transparent",
--    floats = "transparent",
--  },
--  on_highlights = function(hl, c)
--    hl.NeoTreeNormal = { bg = "none" }
--    hl.NeoTreeNormalNC = { bg = "none" }
--  end
--})

--vim.cmd.colorscheme("tokyonight-night")
--Full transparent
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
--vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
--vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
--vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none" })

--semitranspaent
--vim.opt.windblend = 15 -- 0 =solid, 100=full transparent, 15=semi
--vim.opt.pumblend = 15


-- DRACULA SETUP
--require("dracula").setup({
--  transparent_bg = true, -- set true if you want transparent
--  italic_comment = true,
--  show_end_of_buffer = false,
--})
--vim.cmd.colorscheme("dracula")
-- THEME SETUP
--require("catppuccin").setup({
--  flavour = "mocha",             -- mocha, macchiato, frappe, latte
--transparent_background = true, -- keep false for semi
--term_colors = true,
--italic_comment = true,
--show_end_of_buffer = false,
--styles = {
--comments = { "italic" },
--keywords = { "italic" },
--},
--integrations = {
--telescope = true,
--which_key = true,
--blink_cmp = true,
--}
--})
--vim.cmd.colorscheme("catppuccin")

-- theme

-- theme
require("onedarkpro").setup({
  styles = {
    comments = "italic",
    keywords = "bold,italic",
  },
  options = {
    transparency = false, -- set true for transparent
    cursorline = true,
  }
})

vim.cmd.colorscheme("onedark_vivid") -- or onedark, onedark_dark

-- Semi-transparent popups (same as before)
vim.cmd("set winblend=15")
vim.cmd("set pumblend=15")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })


-- Icons must load first
require("nvim-web-devicons").setup()

--require("lualine").setup({ options = { theme = "tokyonight", globalstatus = true } })
--require("lualine").setup({ options = { theme = "dracula", globalstatus = true } })
require("lualine").setup({ options = { theme = "auto", globalstatus = true } })

require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    -- HIDE [No Name]
    custom_filter = function(buf)
      return vim.fn.bufname(buf) ~= ""
    end,
  }
})

require("nvim-autopairs").setup()
require("Comment").setup()
--git setup
require("gitsigns").setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  current_line_blame = false,
})

require("nvim-treesitter").setup({
  ensure_installed = { "lua", "python", "html", "css", "javascript", "bash" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- FIXED NEO-TREE - No green dot, no [No Name] on top
require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = false },
    follow_current_file = { enabled = true, leave_dirs_open = true },
    use_libuv_file_watcher = true,
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = "none",
      ["o"] = "open",
      ["<cr>"] = "open",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["c"] = "close_node",
      ["z"] = "close_all_nodes",
      ["a"] = { "toggle_node", nowait = false },
      ["A"] = "add",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["H"] = "toggle_hidden",
    }
  }
})

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Find Word" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })

vim.g.live_server = { enabled = true, port = 8080, browser_command = "" }

require("copilot").setup({
  suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<Tab>", next = "<M-]>", prev = "<M-[>" } },
  panel = { enabled = false },
})

require("conform").setup({
  formatters_by_ft = { lua = { "stylua" }, python = { "black" }, javascript = { "prettier" }, html = { "prettier" }, css = { "prettier" } },
  format_on_save = { timeout_ms = 500, lsp_fallback = true },
})

require("toggleterm").setup({ size = 15, open_mapping = [[<C-\>]], direction = "float", float_opts = { border = "curved" } })

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright", "html", "cssls", "emmet_ls", "ts_ls" } })
vim.lsp.config('emmet_ls', { filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact" } })
vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
vim.lsp.enable({ "lua_ls", "pyright", "html", "cssls", "emmet_ls", "ts_ls" })

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
  keymap = { preset = "enter" },
  snippets = { preset = 'luasnip' },
  appearance = { nerd_font_variant = 'mono' },
  sources = { default = { 'lsp', 'snippets', 'path', 'buffer' } },
})
vim.diagnostic.config({ virtual_text = true })

map('n', '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'NeoTree Toggle' })
map('n', '<leader>e', '<cmd>Neotree focus<cr>', { desc = 'NeoTree Focus' })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Tab" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Prev Tab" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close Tab" })
map('n', '<leader>o', '<cmd>Neotree reveal<cr>', { desc = 'NeoTree Reveal File' })
map('n', '<leader>ll', '<cmd>LiveServerStart<cr>', { desc = 'live server start' })
map('n', '<leader>ls', '<cmd>LiveServerStop<cr>', { desc = 'live server stop' })
map("n", "<leader>fm", function() require("conform").format() end, { desc = "Format Code" })
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Float Terminal" })
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
map("n", "<leader>tv", ":ToggleTerm direction=vertical size=60<CR>", { desc = "Vertical Terminal" })
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("i", "jk", "<Esc>")
map("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame Line" })
map("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff" })
map("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
map("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Prev Hunk" })
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local m = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc }) end
    m("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    m("n", "gr", builtin.lsp_references, "Go to References")
    m("n", "K", vim.lsp.buf.hover, "Hover Info")
    m("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    m("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local dir = data.file
    if dir and vim.fn.isdirectory(dir) ~= 0 then
      vim.cmd.cd(dir)
      vim.schedule(function()
        require("neo-tree.command").execute({ action = "show" })
        if vim.fn.bufname("") == "" then vim.cmd("bd") end
      end)
    end
  end,
})
