vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.undofile = true
vim.g.mapleader = " "
vim.o.winborder = "rounded"
-- vim.cmd("set completeopt=menuone,noselect,fuzzy,nosort")

vim.env.SDKMAN_DIR = vim.env.HOME .. "/.sdkman"
vim.env.JAVA_HOME = vim.env.HOME .. "/.sdkman/candidates/java/current"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

vim.pack.add({
	{ src = "https://github.com/ribru17/bamboo.nvim" },
	{ src = "https://github.com/craftzdog/solarized-osaka.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.visits" },
	{ src = "https://github.com/nvim-mini/mini.completion" },
	{ src = "https://github.com/nvim-mini/mini.snippets" },
	{ src = "https://github.com/nvim-mini/mini.extra" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		start = true,
		build = ":TSUpdate",
	},
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		start = true,
	},
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
require("toggleterm").setup({
	open_mapping = "<leader>tt",
    insert_mappings = false,
	direction = "float",
})
require("mini.pick").setup()
require("mini.visits").setup()
require("mini.extra").setup()
require("mini.snippets").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("gitsigns").setup()
require("which-key").setup()
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		swift = { "swiftformat", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		htmlangular = { "prettierd", "prettier", stop_after_first = true },
		xml = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "ruff_format" },
		elixir = { "mix" },
		ocaml = { "ocamlformat" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"elixirls",
		"rust_analyzer",
		"gopls",
		"pyright",
	},
})

vim.lsp.config("sourcekit", {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objective-c", "objective-cpp" },
	root_markers = {
		"Package.swift",
		".git",
		"*.xcodeproj",
		"*.xcworkspace",
	},
})
vim.lsp.enable("sourcekit")

vim.lsp.config("ocamllsp", {
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_markers = { "dune-project", ".git", "dune-workspace", "*.opam" },
})
vim.lsp.enable("ocamllsp")

require("nvim-treesitter").setup({
	ensure_installed = {
		"elixir", "lua", "typescript", "javascript", "rust",
		"swift", "ocaml", "go", "python", "java", "json",
		"html", "css", "bash", "toml", "yaml", "markdown",
	},
	highlight = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ia"] = "@parameter.inner",
				["aa"] = "@parameter.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
			},
		},
	},
})
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		pcall(vim.treesitter.start, args.buf)
	end,
})
require("solarized-osaka").setup({
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})
require("catppuccin").setup({
	-- flavour = "frappe",
	styles = {
		comments = {},
		conditionals = {},
	},
})
require("bamboo").setup({
	-- style = "multiplex",
	code_style = {
		comments = { italic = false },
		conditionals = { italic = false },
		keywords = {},
		functions = {},
		namespaces = { italic = false },
		parameters = { italic = false },
		strings = {},
		variables = {},
	},
})
require("rose-pine").setup({
    variant = "moon",
    styles = {
        italic = false,
        transparency = true,
    }
})
vim.cmd.colorscheme("rose-pine")

vim.keymap.set("n", "<leader>o", ":update<CR> :source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>s.", ":Pick visit_paths<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>f", conform.format)
vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "-", ":Oil<CR>")

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
