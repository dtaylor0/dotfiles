vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.env.SDKMAN_DIR = vim.env.HOME .. "/.sdkman"
vim.env.JAVA_HOME = vim.env.HOME .. "/.sdkman/candidates/java/current"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

vim.pack.add({
	{ src = "https://github.com/ribru17/bamboo.nvim" },
	{ src = "https://github.com/craftzdog/solarized-osaka.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.visits" },
	{ src = "https://github.com/nvim-mini/mini.extra" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		start = true,
		build = ":TSUpdate",
	},
})

require("oil").setup()
require("mini.pick").setup()
require("mini.visits").setup()
require("mini.extra").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "elixirls" },
})
require("nvim-treesitter").setup({
	ensure_installed = { "elixir" },
	highlight = { enable = true },
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
vim.cmd.colorscheme("bamboo")

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>s.", ":Pick visit_paths<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "-", ":Oil<CR>")
