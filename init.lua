----------------------------------------
-- Random
----------------------------------------
vim.keymap.set("n", "gj", "<Plug>RestNvim")

vim.keymap.set("n", "<BS><BS>", ":below G<CR>")
vim.keymap.set("v", "<BS><BS>", ":below G<CR>")

vim.keymap.set("n", "<BS>f", ":diffget //2<CR>")
vim.keymap.set("v", "<BS>f", ":diffget //2<CR>")
vim.keymap.set("n", "<BS>j", ":diffget //3<CR>")
vim.keymap.set("v", "<BS>j", ":diffget //3<CR>")

vim.keymap.set("v", "<C-y>", '"*y')
vim.keymap.set("n", "<C-y>", 'y"*y')

----------------------------------------
-- Treesitter
----------------------------------------
local function treesitter_config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensured_installed = {
			"bash",
			"comment",
			"css",
			"html",
			"javascript",
			"jsdoc",
			"jsonc",
			"lua",
			"markdown",
			"regex",
			"scss",
			"toml",
			"typescript",
			"yaml",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end

----------------------------------------
-- GitSigns
----------------------------------------
local gitsigns_opts = {
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "x" },
		topdelete = { text = "X" },
		changedelete = { text = "~" },
		untracked = { text = "*" },
	},
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil,
	max_file_length = 40000,
	preview_config = {
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
}

----------------------------------------
-- RestNvim
----------------------------------------
local rest_nvim_opts = {
	result_split_horizontal = false,
	result_split_in_place = true,
	skip_ssl_verification = false,
	encode_url = true,
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		show_url = true,
		show_http_info = true,
		show_headers = true,
		formatters = {
			json = "jq",
			html = "tidy -i -q -",
		},
	},
	jump_to_request = true,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
}

----------------------------------------
-- Lualine
----------------------------------------
local lualine_opts = {
	options = {
		icons_enabled = false,
		theme = "auto",
		section_separators = "",
		component_separators = "/",
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			},
		},
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 2,
			},
		},
		lualine_z = {},
		lualine_y = {},
		lualine_x = {},
	},
	extensions = { "quickfix", "fugitive", "fzf" },
}

----------------------------------------
-- Livecommand
----------------------------------------
local function live_command_config()
	require("live-command").setup({
		commands = {
			Norm = {
				cmd = "norm",
			},
		},
	})
end

----------------------------------------
-- IncRename
----------------------------------------
local inc_rename_opts = {
	cmd_name = "IncRename",
	hl_group = "Substitute",
	preview_empty_name = false,
	show_message = true,
	input_buffer_type = nil,
	post_hook = nil,
}

----------------------------------------
-- Telescope
----------------------------------------
local telescope_opts = {
	pickers = {
		find_files = {
			theme = "dropdown",
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
		live_grep = {
			theme = "dropdown",
		},
		quickfix = {
			theme = "dropdown",
		},
		commands = {
			theme = "dropdown",
		},
		lsp_dynamic_workspace_symbols = {
			theme = "dropdown",
		},
		git_branches = {
			theme = "dropdown",
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
		},
	},
}

----------------------------------------
-- Colorscheme
----------------------------------------
local function moonfly_init()
	vim.cmd("colorscheme moonfly")
	vim.cmd("hi clear MoonflyTurquoise")
end

--------------------------------------
-- General
--------------------------------------

vim.opt.showmode = false
vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

local TAB_WIDTH = 4
vim.o.expandtab = false
vim.o.tabstop = TAB_WIDTH
vim.o.shiftwidth = TAB_WIDTH
vim.o.shortmess = "I"
vim.o.autowriteall = true

vim.opt.listchars = { tab = ">>", trail = "~", extends = ">", precedes = "<", space = "·" }
vim.opt.list = false
vim.opt.autoread = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.g.moonflyVirtualTextColor = true
vim.g.moonflyUnderlineMatchParen = true
vim.g.moonflyWinSeparator = 2
vim.opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

-- Quickfix
vim.keymap.set("n", "zj", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "zk", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "zl", ":cclose<CR>", { silent = true })

-- Map Control C to Escape
vim.keymap.set("n", "<C-c>", "<Esc>", { silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })
vim.keymap.set("v", "<C-c>", "<Esc>", { silent = true })
-- vim.keymap.set("x", "<C-c>", "<Esc>", { silent = true })
-- vim.keymap.set("o", "<C-c>", "<Esc>", { silent = true })
-- vim.keymap.set("c", "<C-c>", "<Esc>", { silent = true })

-- Autosave on fucus lost
vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	command = "silent! wa",
})

--------------------------------------
-- Plugins
--------------------------------------
local plugins = {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		opts = {
			format = { timeout_ms = 1000 }
		}
	},

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	{
		"smjonas/inc-rename.nvim",
		opts = inc_rename_opts,
	},
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- null_ls.builtins.formatting.stylua,
					-- null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.completion.spell,
				},
			})
		end,
	},

	-- version control
	{ "lewis6991/gitsigns.nvim",       opts = gitsigns_opts },
	"tpope/vim-fugitive",

	-- navigation
	{ "nvim-telescope/telescope.nvim", opts = telescope_opts },
	"ThePrimeagen/harpoon",
	{ "nvim-lualine/lualine.nvim", opts = lualine_opts },
	"tpope/vim-repeat",

	-- shortcuts
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-eunuch",
	"tpope/vim-vinegar",
	"tpope/vim-dotenv",
	"tpope/vim-dispatch",
	"tpope/vim-projectionist",
	"tpope/vim-dadbod",

	-- tools
	{ "smjonas/live-command.nvim", config = live_command_config },
	"ThePrimeagen/vim-be-good",
	"github/copilot.vim",
	{ "rest-nvim/rest.nvim",             opts = rest_nvim_opts },
	"nvim-lua/plenary.nvim",
	"lervag/vimtex",
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			-- { 'tpope/vim-dadbod',                     lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	-- languages
	{ "nvim-treesitter/nvim-treesitter", config = treesitter_config, build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	-- color theme
	{ "bluz71/vim-moonfly-colors", init = moonfly_init, name = "moonfly", lazy = false, priority = 1000 },
	"folke/lsp-colors.nvim",
}

----------------------------------------
-- Lazy
----------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "zf", builtin.find_files, {})
vim.keymap.set("n", "zg", builtin.live_grep, {})
vim.keymap.set("n", "zd", builtin.quickfix, {})
vim.keymap.set("n", "zx", builtin.commands, {})
vim.keymap.set("n", "zs", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "zb", builtin.git_branches, {})
vim.keymap.set("n", "zc", builtin.current_buffer_fuzzy_find, {})

local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

vim.keymap.set("n", "mv", harpoon_ui.toggle_quick_menu, {})
vim.keymap.set("n", "<C-j>", function()
	harpoon_ui.nav_file(1)
end, {})
vim.keymap.set("n", "<C-k>", function()
	harpoon_ui.nav_file(2)
end, {})
vim.keymap.set("n", "<C-l>", function()
	harpoon_ui.nav_file(3)
end, {})
vim.keymap.set("n", "mc", harpoon_mark.add_file, {})

----------------------------------------
-- LSP
----------------------------------------
local cmp = require("cmp")
local luasnip = require("luasnip")

local kind_icons = {
	Text = "...",
	Method = "M()",
	Function = "f()",
	Constructor = "New",
	Field = "[f]",
	Variable = "var",
	Class = "C{}",
	Interface = "I{}",
	Module = "[M]",
	Property = "(p)",
	Unit = "un.",
	Value = "123",
	Enum = "E{}",
	Keyword = "key",
	Snippet = "</>",
	Color = "rgb",
	File = "<f>",
	Reference = "& r",
	Folder = "<d>",
	EnumMember = "E.B",
	Constant = "VAR",
	Struct = "S{}",
	Event = "*ev",
	Operator = "+-=",
	TypeParameter = "<T>",
}

cmp.setup({
	formatting = {
		format = function(entry, vim_item)
			-- This concatenates the icons with the name of the item kind
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.kind = kind_icons[vim_item.kind]

			vim_item.menu = ({
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				luasnip = "[snp]",
				nvim_lua = "[lua]",
				latex_symbols = "[tex]",
			})[entry.source.name]
			return vim_item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[D", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)
	-- Change later
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = false, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set("n", "gr", function()
		return ":IncRename " .. vim.fn.expand("<cword>")
	end, { expr = true })
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "ge", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gj", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<2-LeftMouse>", vim.lsp.buf.definition, bufopts)

	vim.keymap.set("n", "#", vim.lsp.buf.format, bufopts)
	vim.keymap.set("v", "#", vim.lsp.buf.format, bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})

require("lspconfig").tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"rust",
		"heex",
		"eelixir",
		"elixir",
	},
	init_options = {
		userLanguages = {
			elixir = "html-eex",
			eelixir = "html-eex",
			heex = "html-eex",
		},
	},
})

vim.fn.sign_define("DiagnosticSignError", { text = "e", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "w", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "?", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "i", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" })

vim.diagnostic.config({
	virtual_text = { prefix = "", spacing = 10 },
	severity_sort = true,
	float = {
		source = "always",
	},
})

-- add border to lsp float windows
local _border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = _border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = _border,
})

vim.diagnostic.config({
	float = { border = _border },
})
